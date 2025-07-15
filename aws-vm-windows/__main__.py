"""An AWS Python Pulumi program"""

import pulumi
import pulumi_aws as aws

var_size = 't2.large'
var_project_name = "svk-dev-vm"
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
                      owners=["957547624766"],
                      filters=[
                        {
                          "name":"name", 
                         # "values":["Windows_Server-2019-English-Full-Base-2025.04.09"],
                          "values":["Windows_Server-2022-English-Full-EKS_Optimized-1.31-2025.04.14"],
                        },
                        {
                          "name":"root-device-type",
                          "values":["ebs"],
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
            description = 'rdp', protocol='tcp', from_port=3389, to_port=3389, cidr_blocks=['0.0.0.0/0'],
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

user_data="""<script>
    echo "" > _INIT_STARTED_
    net user tester /add /y
    net user tester Azfg45jb12
    net localgroup administrators tester /add
    echo "" > _INIT_COMPLETE_
    powershell Set-MpPreference -DisableRealtimeMonitoring $true
    powershell Set-ItemProperty -Path HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System -Name EnableLUA -Value 0
    curl https://download.sysdig.com/stable/msi/x86_64/sysdig-host-shield-latest.msi -o c:\\sysdig-host-shield-latest.msi
    msiexec /i c:\sysdig-host-shield-latest.msi ACCEPT_TERMS_CONDITIONS=True REGION=au1 ACCESS_KEY=XXX VM_FEATURE_ENABLED=True POSTURE_FEATURE_ENABLED=True  /qn /l*! c:\\install.log
    </script>
"""



server = aws.ec2.Instance(var_project_name + '-server',
    instance_type=var_size,
    vpc_security_group_ids=[group.id],
    user_data=user_data,
    #key_name=var_key_name,
    subnet_id=main_subnet.id,
    ami=ami.id,
    tags={
        "Name": var_project_name + "-instance"
    },
)

pulumi.export('public_ip', server.public_ip)
pulumi.export('public_dns', server.public_dns)
