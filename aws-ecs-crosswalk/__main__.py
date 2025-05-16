import pulumi
import pulumi_aws as aws
import pulumi_awsx as awsx

#pulumi config set cfg:var_container_port 80
stack_config = pulumi.Config("cfg")
var_cluster_name = stack_config.require("cluster-name")
var_service_name= stack_config.require("service-name")
var_host_port= int(stack_config.require("host-port"))
var_container_port= int(stack_config.require("container-port"))

repository = awsx.ecr.Repository(
    "repository",
    awsx.ecr.RepositoryArgs(
        name=var_cluster_name + "-repo",
        force_delete=True
    ),
)

#image = awsx.ecr.Image(
#    "image",
#    repository_url=repository.url, 
#    builder_version=awsx.ecr.BuilderVersion.BUILDER_V1,
#    context="/root/swapi-json-server/", 
#    image_name="swapi2", 
#    platform="linux/x86_64"
#)

ecs_cluster = aws.ecs.Cluster("cluster",
    name=var_cluster_name,)
lb = awsx.lb.ApplicationLoadBalancer("lb",
    name=var_cluster_name + "-lb",
    default_target_group_port=var_host_port,
)

service = awsx.ecs.FargateService("service",
    awsx.ecs.FargateServiceArgs(
        name=var_cluster_name + "-" + var_service_name,
        cluster=ecs_cluster.arn,
        assign_public_ip=True,
        propagate_tags="SERVICE",
        task_definition_args=awsx.ecs.FargateServiceTaskDefinitionArgs(
            container=awsx.ecs.TaskDefinitionContainerDefinitionArgs(
                name=var_service_name,
                image="nginx",
                #image=image.image_uri,
                cpu=2048,
                memory=4096,
                essential=True,
                port_mappings=[
                    awsx.ecs.TaskDefinitionPortMappingArgs(
                        host_port=var_host_port,
                        container_port=var_container_port,
                        target_group=lb.default_target_group,
                    )
                ],
            ),
        ),
    ),
)

pulumi.export("url", pulumi.Output.format("http://{0}:{1}", lb.load_balancer.dns_name, var_host_port))

##pulumi stack output kubeconfig --show-secrets > kubeconfig
# Export values to use elsewhere
pulumi.export("cluster_info", ecs_cluster)
pulumi.export("svc", service)

