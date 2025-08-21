"""An AWS Python Pulumi program"""

import pulumi
import pulumi_aws as aws

var_size = 't2.micro'
var_project_name = "svk-harbor"
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
            description = 'http', protocol='tcp', from_port=80, to_port=80, cidr_blocks=['0.0.0.0/0'],
          ),
          aws.ec2.SecurityGroupIngressArgs(
            description = 'https', protocol='tcp', from_port=443, to_port=443, cidr_blocks=['0.0.0.0/0'],
          ),
          aws.ec2.SecurityGroupIngressArgs(
            description = 'ssh', protocol='tcp', from_port=22, to_port=22, cidr_blocks=['0.0.0.0/0'],
          ),
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
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install docker.io -y
apt-get install jq -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /root/
wget https://github.com/goharbor/harbor/releases/download/v2.13.1/harbor-online-installer-v2.13.1.tgz
tar xzvf harbor-online-installer-v2.13.1.tgz
cd harbor
mkdir /data/
mkdir /data/cert/

HOSTNAME=$(curl -s www.httpbin.org/ip | jq -r .origin)
sed "s/hostname: reg.mydomain.com/hostname: $HOSTNAME/g" harbor.yml.tmpl  > harbor.tmp
sed "s|  certificate: /your/certificate/path|  certificate: /data/cert/yourdomain.com.crt|g" harbor.tmp > harbor.tmp2 
sed "s|  private_key: /your/private/key/path|  private_key: /data/cert/yourdomain.com.key|g" harbor.tmp2 > harbor.yml

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=here/L=there/O=example/OU=Personal/CN=yourdomain.com" \
 -key ca.key \
 -out ca.crt
openssl genrsa -out yourdomain.com.key 4096
openssl req -sha512 -new \
    -subj "/C=CN/ST=here/L=there/O=example/OU=Personal/CN=yourdomain.com" \
    -key yourdomain.com.key \
    -out yourdomain.com.csr
cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=yourdomain.com
DNS.2=yourdomain
DNS.3=hostname
EOF

echo "IP.1=$HOSTNAME" >> v3.ext

openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in yourdomain.com.csr \
    -out yourdomain.com.crt
cp yourdomain.com.crt /data/cert/
cp yourdomain.com.key /data/cert/

openssl x509 -inform PEM -in yourdomain.com.crt -out yourdomain.com.cert
mkdir -p /etc/docker/certs.d/yourdomain.com/
cp yourdomain.com.cert /etc/docker/certs.d/yourdomain.com/
cp yourdomain.com.key /etc/docker/certs.d/yourdomain.com/
cp ca.crt /etc/docker/certs.d/yourdomain.com/

./install.sh
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

pulumi.export('public_ip', server.public_ip)
pulumi.export('public_dns', server.public_dns)
