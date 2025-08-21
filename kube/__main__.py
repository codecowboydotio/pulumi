import pulumi
import pulumi_awsx as awsx
import pulumi_aws as aws
import pulumi_eks as eks
import os
import pulumi_command
import requests

# Get some values from the Pulumi configuration (or use defaults)
config = pulumi.Config()
min_cluster_size = config.get_float("minClusterSize", 3)
max_cluster_size = config.get_float("maxClusterSize", 6)
desired_cluster_size = config.get_float("desiredClusterSize", 3)
eks_node_instance_type = config.get("eksNodeInstanceType", "t3.large")
vpc_network_cidr = config.get("vpcNetworkCidr", "10.0.0.0/16")
cluster_name = config.get("name")

def update_kube(args: pulumi.ResourceHookArgs):
    outputs = args.new_outputs
    pulumi.log.info("Opening tunnel")
    update_config = os.system("pulumi stack output kubeconfig --show-secrets > kubeconfig.json")
    pulumi.log.info(f"Tunnel opened: {update_config}")

def health_check(args: pulumi.ResourceHookArgs):
    # Since this is an after hook, we'll have access to the new outputs of the
    # resource.
    outputs = args.new_outputs

    # Attempt to fetch health.json from the instance's public endpoint, backing
    # off linearly if it is not yet available.
    max_retries = 30
    for i in range(max_retries):
        try:
            response = requests.get(
                f"http://{outputs['publicDns']}/health.json", timeout=10
            )
            if response.status_code == 200:
                data = response.json()
                print(f"Health check passed: {json.dumps(data)}")
                return
        except Exception as error:
            print(f"Health check attempt {i + 1} failed: {error}")

        # Linear backoff - wait (i + 1) seconds before next attempt
        time.sleep(i + 1)


# Create a VPC for the EKS cluster
eks_vpc = awsx.ec2.Vpc(
    cluster_name + "-vpc",
    enable_dns_hostnames=True,
    cidr_block=vpc_network_cidr)

# Create the EKS cluster
eks_cluster = eks.Cluster(
    cluster_name,
    # Put the cluster in the new VPC created earlier
    vpc_id=eks_vpc.vpc_id,
    # Public subnets will be used for load balancers
    subnet_ids=eks_vpc.public_subnet_ids,
    #public_subnet_ids=eks_vpc.public_subnet_ids,
    # Private subnets will be used for cluster nodes
    #private_subnet_ids=eks_vpc.private_subnet_ids,
    # Change configuration values to change any of the following settings
    instance_type=eks_node_instance_type,
    desired_capacity=desired_cluster_size,
    min_size=min_cluster_size,
    max_size=max_cluster_size,
    # Do not give worker nodes a public IP address
    node_associate_public_ip_address=True,
    # Uncomment the next two lines for private cluster (VPN access required)
    # endpoint_private_access=true,
    # endpoint_public_access=false
    opts=pulumi.ResourceOptions(
        hooks=pulumi.ResourceHookBinding(
            after_create=[health_check],
            after_update=[update_kube],
        ),
    ),
    )


##pulumi stack output kubeconfig --show-secrets > kubeconfig.json
# Export values to use elsewhere
pulumi.export("kubeconfig", eks_cluster.kubeconfig)
#pulumi.export("vpcId", eks_vpc)
pulumi.export("vpcPrivateSubnetIds", eks_vpc.private_subnet_ids)
pulumi.export("vpcPublicSubnetIds", eks_vpc.public_subnet_ids)
