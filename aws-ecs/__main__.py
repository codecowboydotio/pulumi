"""Deploys ECS with EC2 container instances (as opposed to using Fargate)."""
import json
import pulumi
import pulumi_aws as aws

#pulumi config set cfg:var_project_name aws-ecs

region = aws.config.region or "ap-southeast-2" 
avail_zone = region+"a" # e.g. us-east-1a 

stack_config = pulumi.Config("cfg")
asg_size = int(stack_config.require("autoscalingGroupSize")) 
var_project_name = stack_config.require("var_project_name")

var_vpc_name = var_project_name + "-vpc"
var_key_name = 'svk-keypair'
var_vpc_cidr_block = '10.100.0.0/16'
var_subnet_cidr_block = '10.100.1.0/24'
var_subnet2_cidr_block = '10.100.2.0/24'

vpc = aws.ec2.Vpc(
        var_project_name + "-" + var_vpc_name,
        cidr_block=var_vpc_cidr_block,
        tags={
          "Name": var_project_name + "-" + var_vpc_name,
        }
)

main_subnet = aws.ec2.Subnet(var_project_name + "-subnet",
    vpc_id=vpc.id,
    cidr_block=var_subnet_cidr_block,
    map_public_ip_on_launch=True,
    tags={
      "Name": var_project_name + "-subnet",
    }
)

main_igw = aws.ec2.InternetGateway(var_project_name + "-" + var_vpc_name + "-igw",
    vpc_id=vpc.id,
    tags={
        "Name": var_project_name + "-igw"
    }
)

subnet2 = aws.ec2.Subnet(var_project_name + "-subnet2",
    vpc_id=vpc.id,
    cidr_block=var_subnet2_cidr_block,
    map_public_ip_on_launch=True,
    tags={
      "Name": var_project_name + "-subnet2",
    }
)

main_route_table = aws.ec2.RouteTable(var_project_name + "-" + var_vpc_name + "-rt",
    vpc_id=vpc.id,
    routes=[
        aws.ec2.RouteTableRouteArgs(
            cidr_block="0.0.0.0/0",
            gateway_id=main_igw.id,
        ),
    ],
    tags={
        "Name": var_project_name + "-rt"
    }
)

main_rt_assoc = aws.ec2.RouteTableAssociation(var_project_name + "-" + var_vpc_name + "-rt",
    subnet_id = main_subnet.id,
    route_table_id = main_route_table.id
)

main_rt_assoc2 = aws.ec2.RouteTableAssociation(var_project_name + "-" + var_vpc_name + "-rt2",
    subnet_id = subnet2.id,
    route_table_id = main_route_table.id
)

group = aws.ec2.SecurityGroup(var_project_name + "-sg",
    description = var_project_name,
    vpc_id = vpc.id,
        ingress = [aws.ec2.SecurityGroupIngressArgs(
            protocol='-1',
            from_port=0,
            to_port=0,
            cidr_blocks=['0.0.0.0/0'],
        )],
        egress = [aws.ec2.SecurityGroupEgressArgs(
            protocol=-1,
            from_port=0,
            to_port=0,
            cidr_blocks=['0.0.0.0/0'],
        )],
        tags={
        "Name": var_project_name + "-sg",
        "auto-remediate": "true"
        }
)

ecs_cluster = aws.ecs.Cluster("foo",
    name=stack_config.require("cluster-name"),
    settings=[{
        "name": "containerInsights",
        "value": "enabled",
    }],
)
