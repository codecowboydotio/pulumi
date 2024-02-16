"use strict";
const pulumi = require("@pulumi/pulumi");
const aws = require("@pulumi/aws");
const awsx = require("@pulumi/awsx");

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

const main_subnet = new aws.ec2.Subnet(var_project_name + var_vpc_name + "-subnet", {
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


const main_rt_assoc = new aws.ec2.RouteTableAssociation(var_project_name + "-" + var_vpc_name + "-rta", {
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

const group = new aws.ec2.SecurityGroup(var_project_name + "-" + var_vpc_name + "-sg", {
  description: "foo",
  vpcId: vpc.id,
  ingress: [{
    description: "Ingress",
    fromPort: 0,
    toPort: 0,
    protocol: "-1",
    cidrBlocks: ["0.0.0.0/0"],
  }],
  egress: [{
    fromPort: 0,
    toPort: 0,
    protocol: "-1",
    cidrBlocks: ["0.0.0.0/0"],
  }],
});

const user_data =`#!/bin/bash
echo "foo" > /tmp/foo`

const server = new aws.ec2.Instance(var_project_name + "-" + var_vpc_name + "-instance",{
  ami: ami.then(ami => ami.id),
  instanceType: "t2.micro", 
  subnetId: main_subnet.id,
  userData: user_data,
  tags: {
    "Name": var_project_name + "-instance",
  },
});
