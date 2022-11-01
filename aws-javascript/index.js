"use strict";
const pulumi = require("@pulumi/pulumi");
const aws = require("@pulumi/aws");
const awsx = require("@pulumi/awsx");

// Create an AWS resource (S3 Bucket)
//const bucket = new aws.s3.Bucket("my-bucket");

// Export the name of the bucket
//exports.bucketName = bucket.id;


var var_size = 't2.micro'
var var_project_name = "pulumi-javascript"
var var_vpc_name = "vpc"
var var_key_name = 'svk_keypair'
var var_vpc_cidr_block = '10.100.0.0/16'
var var_subnet_cidr_block = '10.100.1.0/24'

const vpc = new aws.ec2.Vpc(var_project_name + "-" + var_vpc_name, {
  cidrBlock: var_vpc_cidr_block,
  tags: {
    "Name": var_project_name + "-" + var_vpc_name,
  }
});    

const main_subnet = new aws.ec2.Subnet(var_project_name + "-" + var_vpc_name, {
  vpcId: vpc.id,
  cidrBlock: var_subnet_cidr_block,
  mapPublicIpOnLaunch: true,
  tags: {
          "Name": var_project_name + "-subnet"
  }
});
  
const main_igw = new aws.ec2.InternetGateway(var_project_name + "-" + var_vpc_name + "-igw", {
  vpcId: vpc.id,
  tags: {
          "Name": var_project_name + "-igw"
  }
});



const main_route_table = new aws.ec2.RouteTable(var_project_name + "-" + var_vpc_name + "-rt", {
  vpcId: vpc.id,
  routes:
  [
    {
      cidrBlock: "0.0.0.0/0",
      gatewayId: main_igw.id,
    },
  ],
  tags: 
  {
      "Name": var_project_name + "-rt"
  }
});


const main_rt_assoc = new aws.ec2.RouteTableAssociation(var_project_name + "-" + var_vpc_name + "-rt", {
    subnetId: main_subnet.id,
    routeTableId: main_route_table.id
 }
);


const ami = new aws.ec2.getAmi({
  mostRecent: true,
  owners: ["099720109477"],
  filters: [
    {
      name: "name",
      values: ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04*"]
    },
    {
      name: "virtualization-type",
      values: ["hvm"]
    },
    {
      name: "architecture",
      values: ["x86_64"],
    },
  ],
});


