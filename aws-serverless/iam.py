# Copyright 2016-2018, Pulumi Corporation.  All rights reserved.

from pulumi_aws import iam

lambda_role = iam.Role(
    "lambdaRole",
    name="svk-lambda-role",
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

#lambda_role_policy = iam.RolePolicy(
#    "lambdaRolePolicy",
#    name="svk-lambda-role-policy",
#    role=lambda_role.id,
#    policy="""{
#        "Version": "2012-10-17",
#        "Statement": [{
#            "Effect": "Allow",
#            "Action": [
#                "logs:CreateLogGroup",
#                "logs:CreateLogStream",
#                "logs:PutLogEvents"
#            ],
#            "Resource": "arn:aws:logs:*:*:*"
#        }]
#    }""",
#)

execution_attachment = iam.PolicyAttachment("svk-execution-attach",
    name="svk-execution-attachment",
    roles=[lambda_role.name],
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
)
