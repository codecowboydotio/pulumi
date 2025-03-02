# Copyright 2016-2018, Pulumi Corporation.  All rights reserved.

from pulumi_aws import iam
import pulumi

config = pulumi.Config()
project = config.get("project")
name_prefix = config.get("name-prefix")

lambda_role = iam.Role(
    name_prefix + "-" + project + "-lambda-role",
    name=name_prefix + "-" + project + "-lambda-role",
    assume_role_policy="""{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }""",
)

execution_attachment = iam.PolicyAttachment(
    name_prefix + "-" + project + "-execution-attachment",
    name=name_prefix + "-" + project + "-execution-attachment",
    roles=[lambda_role.name],
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
)
