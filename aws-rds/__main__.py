import pulumi
import pulumi_aws as aws
import pulumi_command as command

# Get some values from the Pulumi configuration (or use defaults)
config = pulumi.Config()
db_name = config.get("db_name")
db_engine = config.get("db_engine")
engine_version = config.get("engine_version")
instance_class = config.get("instance_class")
db_username = config.get("db_username")
db_password = config.get("db_password")
var_project_name = config.get("project_nane", "svk")
var_vpc_name = "vpc"
var_vpc_cidr_block = '10.100.0.0/16'
var_subnet_cidr_block = '10.100.1.0/24'
var_secondary_subnet_cidr_block = '10.100.2.0/24'

vpc = aws.ec2.Vpc(
        var_project_name + "-" + var_vpc_name,
        cidr_block=var_vpc_cidr_block,
        enable_dns_hostnames=True,
        enable_dns_support=True,
        tags={
          "Name": var_project_name + "-" + var_vpc_name,
        }
)

main_subnet = aws.ec2.Subnet(var_project_name + "-subnet",
    vpc_id=vpc.id,
    cidr_block=var_subnet_cidr_block,
    map_public_ip_on_launch=True,
    availability_zone = "ap-southeast-2a",
    tags={
        "Name": var_project_name + "-subnet"
    }
)
secondary_subnet = aws.ec2.Subnet(var_project_name + "secondary-subnet",
    vpc_id=vpc.id,
    cidr_block=var_secondary_subnet_cidr_block,
    map_public_ip_on_launch=True,
    availability_zone = "ap-southeast-2b",
    tags={
        "Name": var_project_name + "secondary-subnet"
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

main_rt_assoc2 = aws.ec2.RouteTableAssociation(var_project_name + "-" + var_vpc_name + "-rt2",
    subnet_id = secondary_subnet.id,
    route_table_id = main_route_table.id
)

group = aws.ec2.SecurityGroup(var_project_name + "-sg",
    description = var_project_name,
    vpc_id = vpc.id,
        ingress = [
          aws.ec2.SecurityGroupIngressArgs(
            description = 'mysql', protocol='tcp', from_port=3306, to_port=3306, cidr_blocks=['0.0.0.0/0'],
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


dbsubnet = aws.rds.SubnetGroup(var_project_name + "-dbsubnet",
    name="main",
    subnet_ids=[
      main_subnet,      
      secondary_subnet,
    ],
    tags={
        "Name": "My DB subnet group",
    })

my_db = aws.rds.Instance(var_project_name + "-db",
    allocated_storage=10,
    db_name=db_name,
    engine=db_engine,
    instance_class=instance_class,
    username=db_username,
    password=db_password,
    publicly_accessible = True,
    db_subnet_group_name = dbsubnet.name,
    port = 3306,
    vpc_security_group_ids = [group.id],
    skip_final_snapshot=True)

fooble = my_db.address.apply(lambda addr: f"mysql -h {addr} -u foo -pfoobarbaz < cc2.sql")

sql_script_path='cc2.sql'
run_sql_script = command.local.Command("run-sql-script",
    create=fooble,
    opts=pulumi.ResourceOptions(depends_on=[
        my_db
        # Add dependencies on your MySQL database or other resources if necessary
    ])
)


#pulumi.export("default", my_db)
pulumi.export("address", my_db.address)


