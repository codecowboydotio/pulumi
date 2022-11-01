"""An AWS Python Pulumi program to stand up Consul"""

import pulumi
import pulumi_aws as aws

var_size = 't2.micro'
var_project_name = "consul-python"
var_vpc_name = "vpc"
var_key_name = 'svk_keypair'
var_vpc_cidr_block = '10.100.0.0/16'
var_subnet_cidr_block = '10.100.1.0/24'

vpc = aws.ec2.Vpc(
        var_project_name + "-" + var_vpc_name, 
        cidr_block=var_vpc_cidr_block,
        tags={
          "Name": var_project_name + "-" + var_vpc_name,
        }
)
                  
main_subnet = aws.ec2.Subnet(var_vpc_name + "-subnet",
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
                        aws.GetAmiFilterArgs(
                          name="name", 
                          values=["ubuntu/images/hvm-ssd/ubuntu-focal-20.04*"]
                        ),
                        aws.ec2.GetAmiFilterArgs(
                          name="virtualization-type",
                          values=["hvm"]
                        ),
                        aws.ec2.GetAmiFilterArgs(
                          name="architecture",
                          values=["x86_64"]
                        ),
                      ],
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
        "Name": var_project_name + "-sg"
        }
)

user_data="""#!/bin/bash
FILE=/tmp/firstrun.log
if [ ! -e $FILE ]
then
 touch $FILE
 nohup $0 0<&- &>/dev/null &
 exit
fi

exec 1<&-
exec 2<&-
exec 1<>$FILE
exec 2>&1
echo "firstrun debug: starting-config"

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul

mkdir /var/log/consul
curl https://raw.githubusercontent.com/codecowboydotio/terraform/main/consul_demo/files/consul.service -o /usr/lib/systemd/system/consul.service
cat << EOF > /etc/consul.d/consul.json
{
  "bootstrap": true,
  "server": true,
  "datacenter": "dc1",
  "data_dir": "/var/consul",
  "log_level": "INFO",
  "node_name": "server-node",
  "client_addr": "0.0.0.0",
  "bind_addr": "0.0.0.0",
  "bootstrap_expect": 1,
  "ui": true,
  "log_file": "/var/log/consul/consul.log"
}
EOF

systemctl start consul.service
echo "firstrun debug: finished-config"
"""


client_user_data="""#!/bin/bash
FILE=/tmp/firstrun.log
if [ ! -e $FILE ]
then
 touch $FILE
 nohup $0 0<&- &>/dev/null &
 exit
fi

exec 1<&-
exec 2<&-
exec 1<>$FILE
exec 2>&1
echo "firstrun debug: starting-config"
echo "firstrun debug: finished-config"

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul

echo "consul agent -config-dir=/etc/consul.d -log-file=/var/log/consul/consul.log -data-dir=/tmp -retry-join IP" > /root/consul.sh
chmod 755 /root/consul.sh
"""

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
)

consul_client = aws.ec2.Instance(var_project_name + '-client',
    instance_type=var_size,
    vpc_security_group_ids=[group.id],
    user_data=client_user_data,
    key_name=var_key_name,
    subnet_id=main_subnet.id,
    ami=ami.id,
    tags={
        "Name": var_project_name + "-client"
    },
)

pulumi.export('public_ip', server.public_ip)
pulumi.export('client_public_ip', consul_client.public_ip)
pulumi.export('public_dns', server.public_dns)

print("Consul Server address is port 8500")


