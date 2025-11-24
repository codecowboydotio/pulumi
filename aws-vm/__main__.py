"""An AWS Python Pulumi program"""

import pulumi
import pulumi_aws as aws
import json
import time
import requests

var_size = 't2.micro'
var_project_name = "svk-vm"
var_vpc_name = "vpc"
var_key_name = 'svk-keypair'
var_vpc_cidr_block = '10.100.0.0/16'
var_subnet_cidr_block = '10.100.1.0/24'

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
        "Name": var_project_name + "-subnet"
    }
)

main_igw = aws.ec2.InternetGateway(var_project_name + "-" + var_vpc_name + "-igw",
    vpc_id=vpc.id,
    tags={
        "Name": var_project_name + "-igw"
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


ami = aws.ec2.get_ami(most_recent=True,
                      owners=["099720109477"],
                      filters=[
                        {
                          "name":"name", 
                          "values":["ubuntu/images/hvm-ssd/ubuntu-*-22.04*"],
                          #"values":["ubuntu/images/hvm-ssd/ubuntu-focal-20.04*"],
                        },
                        {
                          "name":"virtualization-type",
                          "values":["hvm"],
                        },
                        {
                          "name":"architecture",
                          "values":["x86_64"]
                        }
                      ],
)

group = aws.ec2.SecurityGroup(var_project_name + "-sg",
    description = var_project_name,
    vpc_id = vpc.id,
        ingress = [
          aws.ec2.SecurityGroupIngressArgs(
            description = 'telnet', protocol='tcp', from_port=23, to_port=23, cidr_blocks=['0.0.0.0/0'],
          ),
          aws.ec2.SecurityGroupIngressArgs(
            description = 'ssh', protocol='tcp', from_port=22, to_port=22, cidr_blocks=['0.0.0.0/0'],
          ),
          aws.ec2.SecurityGroupIngressArgs(
            description = 'jenkins', protocol='tcp', from_port=8080, to_port=8080, cidr_blocks=['0.0.0.0/0'],
          ),
          aws.ec2.SecurityGroupIngressArgs(
            description = 'rdp', protocol='tcp', from_port=3389, to_port=3389, cidr_blocks=['0.0.0.0/0'],
          ),
          aws.ec2.SecurityGroupIngressArgs(
            description = 'www', protocol='tcp', from_port=80, to_port=80, cidr_blocks=['0.0.0.0/0'],
          )
        ],
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

user_data="""#!/bin/bash
apt install -y nikto
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apache2
systemctl start apache2
git clone https://github.com/codecowboydotio/pacman-unit /root/pacman-unit
cd /root/pacman-unit
cp -pR /root/pacman-unit/* /var/www/html
"""

#def health_check(args: pulumi.ResourceHookArgs):
#    # Since this is an after hook, we'll have access to the new outputs of the
#    # resource.
#    outputs = args.new_outputs
#
#    # Attempt to fetch health.json from the instance's public endpoint, backing
#    # off linearly if it is not yet available.
#    max_retries = 30
#    for i in range(max_retries):
#        try:
#            response = requests.get(
#                f"http://{outputs['public_dns']}", timeout=10
#            )
#            if response.status_code == 200:
#                data = response.json()
#                print(f"Health check passed: {json.dumps(data)}")
#                return
#        except Exception as error:
#            print(f"Health check attempt {i + 1} failed: {error}")
#
#        # Linear backoff - wait (i + 1) seconds before next attempt
#        time.sleep(i + 1)

server = aws.ec2.Instance(var_project_name + '-server',
    instance_type=var_size,
    vpc_security_group_ids=[group.id],
    user_data=user_data,
    key_name=var_key_name,
    subnet_id=main_subnet.id,
    ami=ami.id,
    tags={
        "Name": var_project_name + "-instance"
    },
    #opts=pulumi.ResourceOptions(
    #    hooks=pulumi.ResourceHookBinding(
    #        after_create=[health_check],
    #        after_update=[health_check],
    #    ),
    #),
)

pulumi.export('public_ip', server.public_ip)
pulumi.export('public_dns', server.public_dns)
