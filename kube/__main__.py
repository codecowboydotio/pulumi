import pulumi
import pulumi_awsx as awsx
import pulumi_aws as aws
import pulumi_eks as eks

# Get some values from the Pulumi configuration (or use defaults)
config = pulumi.Config()
min_cluster_size = config.get_float("minClusterSize", 3)
max_cluster_size = config.get_float("maxClusterSize", 6)
desired_cluster_size = config.get_float("desiredClusterSize", 3)
eks_node_instance_type = config.get("eksNodeInstanceType", "t3.large")
vpc_network_cidr = config.get("vpcNetworkCidr", "10.0.0.0/16")
cluster_name = config.get("name")

# Create a VPC for the EKS cluster
eks_vpc = awsx.ec2.Vpc(
    cluster_name + "-vpc",
    enable_dns_hostnames=True,
    cidr_block=vpc_network_cidr)

# Create the EKS cluster
eks_cluster = eks.Cluster(cluster_name,
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
    )

#alb = awsx.lb.ApplicationLoadBalancer(
#    "lb",
#    awsx.lb.ApplicationLoadBalancerArgs(
#        listener=awsx.lb.ListenerArgs(
#            port=80,
#        ),
#    ),
#)

# Export the resulting URL so that it's easy to access.
#pulumi.export("endpoint", alb.load_balancer.dns_name)

pulumi.export("foo", eks_cluster)


##pulumi stack output kubeconfig --show-secrets > kubeconfig.json
# Export values to use elsewhere
pulumi.export("kubeconfig", eks_cluster.kubeconfig)
pulumi.export("vpcId", eks_vpc)
pulumi.export("vpcPrivateSubnetIds", eks_vpc.private_subnet_ids)
pulumi.export("vpcPublicSubnetIds", eks_vpc.public_subnet_ids)
