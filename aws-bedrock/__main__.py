import pulumi
import pulumi_aws as aws
import json

# Get current AWS region and account
current = aws.get_caller_identity()
region = aws.get_region()

# Create an IAM role for Bedrock access
bedrock_role = aws.iam.Role("bedrock-role",
    assume_role_policy=json.dumps({
        "Version": "2012-10-17",
        "Statement": [{
            "Action": "sts:AssumeRole",
            "Effect": "Allow",
            "Principal": {
                "Service": "bedrock.amazonaws.com"
            }
        }]
    }),
    description="IAM role for AWS Bedrock"
)

# Attach policy for Bedrock model invocation
bedrock_policy = aws.iam.RolePolicy("bedrock-policy",
    role=bedrock_role.id,
    policy=json.dumps({
        "Version": "2012-10-17",
        "Statement": [{
            "Effect": "Allow",
            "Action": [
                "bedrock:InvokeModel",
                "bedrock:InvokeModelWithResponseStream"
            ],
            "Resource": "*"
        }]
    })
)

# Create S3 bucket for Bedrock outputs (optional, but useful for some features)
bedrock_bucket = aws.s3.Bucket("bedrock-outputs",
    tags={
        "Name": "bedrock-outputs",
        "Purpose": "Bedrock model outputs"
    }
)

# Enable versioning on the bucket
bucket_versioning = aws.s3.BucketVersioning("bedrock-bucket-versioning",
    bucket=bedrock_bucket.id,
    versioning_configuration=aws.s3.BucketVersioningV2VersioningConfigurationArgs(
        status="Enabled"
    )
)

# Block public access to the bucket
bucket_public_access_block = aws.s3.BucketPublicAccessBlock("bedrock-bucket-public-access",
    bucket=bedrock_bucket.id,
    block_public_acls=True,
    block_public_policy=True,
    ignore_public_acls=True,
    restrict_public_buckets=True
)

# Create CloudWatch Log Group for Bedrock model invocations
bedrock_log_group = aws.cloudwatch.LogGroup("bedrock-logs",
    name="/aws/bedrock/model-invocations",
    retention_in_days=7,
    tags={
        "Purpose": "Bedrock model invocation logs"
    }
)

# Create an IAM policy for application access to Bedrock
app_bedrock_policy = aws.iam.Policy("app-bedrock-access",
    description="Policy for applications to access Bedrock",
    policy=json.dumps({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "bedrock:InvokeModel",
                    "bedrock:InvokeModelWithResponseStream",
                    "bedrock:ListFoundationModels",
                    "bedrock:GetFoundationModel"
                ],
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": [
                    "s3:PutObject",
                    "s3:GetObject"
                ],
                "Resource": pulumi.Output.concat(bedrock_bucket.arn, "/*")
            }
        ]
    })
)

# Export useful values
pulumi.export("bedrock_role_arn", bedrock_role.arn)
pulumi.export("bedrock_bucket_name", bedrock_bucket.id)
pulumi.export("bedrock_log_group_name", bedrock_log_group.name)
pulumi.export("app_policy_arn", app_bedrock_policy.arn)
pulumi.export("region", region.name)
pulumi.export("account_id", current.account_id)

# Export example Python code to use Bedrock
pulumi.export("usage_example", """
# Install boto3: pip install boto3

import boto3
import json

bedrock_runtime = boto3.client('bedrock-runtime', region_name='{}')

# Example: Invoke Claude model
response = bedrock_runtime.invoke_model(
    modelId='anthropic.claude-3-5-sonnet-20241022-v2:0',
    body=json.dumps({{
        "anthropic_version": "bedrock-2023-05-31",
        "max_tokens": 1024,
        "messages": [
            {{"role": "user", "content": "Hello, how are you?"}}
        ]
    }})
)

result = json.loads(response['body'].read())
print(result['content'][0]['text'])
""".format(region.name))
