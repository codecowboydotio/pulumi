import pulumi
import pulumi_aws as aws
import pulumi_random as random

config = pulumi.Config()
project_name = config.get("project_nane", "svk")
project_purpose = config.get("bucket_name", "codebuild")


# Random suffix for bucket
random = random.RandomString("random",
    length=6,
    upper=False,
    special=False
)

bucket_name = random.id.apply(lambda id: f"{project_name}-{project_purpose}-{id}")

# Create an AWS resource (S3 Bucket)

codebuild_bucket = aws.s3.Bucket("codebuild", 
    bucket=bucket_name,
    force_destroy=True)
#codebuild_bucket_acl = aws.s3.BucketAcl("codebuild",
#    bucket=codebuild_bucket.id,
#    acl="private")
assume_role = aws.iam.get_policy_document(statements=[{
    "effect": "Allow",
    "principals": [{
        "type": "Service",
        "identifiers": ["codebuild.amazonaws.com"],
    }],
    "actions": ["sts:AssumeRole"],
}])


codebuild_role = aws.iam.Role("codebuild_role",
    name=project_name + "-" + project_purpose,
    assume_role_policy=assume_role.json
)

codebuild_runner_json = pulumi.Output.all(
    CodebuildBucketArn=codebuild_bucket.arn,
    CodebuildBucketArn1=codebuild_bucket.arn
).apply(lambda resolved_outputs: aws.iam.get_policy_document_output(statements=[
    {
        "effect": "Allow",
        "actions": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
        ],
        "resources": ["*"],
    },
    {
        "effect": "Allow",
        "actions": [
            "ec2:CreateNetworkInterface",
            "ec2:DescribeDhcpOptions",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DeleteNetworkInterface",
            "ec2:DescribeSubnets",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeVpcs",
        ],
        "resources": ["*"],
    },
    {
        "effect": "Allow",
        "actions": ["ec2:CreateNetworkInterfacePermission"],
        "resources": ["arn:aws:ec2:ap-southeast-2:469568072720:network-interface/*"],
    },
    {
        "effect": "Allow",
        "actions": ["s3:*"],
        "resources": [
            resolved_outputs['CodebuildBucketArn'],
            f"{resolved_outputs['CodebuildBucketArn1']}/*",
        ],
    },
    {
        "effect": "Allow",
        "actions": [
            "codeconnections:GetConnectionToken",
            "codeconnections:GetConnection",
        ],
        "resources": ["arn:aws:codestar-connections:ap-southeast-2:469568072720:connection/guid-string"],
    },
]))

codebuild_runner_role_policy = aws.iam.RolePolicy("codebuild_runner_role_policy",
    role=codebuild_role.name,
    policy=codebuild_runner_json.json)


#example_project = aws.codebuild.Project("example",
#    name="test-project",
#    description="test_codebuild_project",
#    build_timeout=5,
#    service_role=example_role.arn,
#    artifacts={
#        "type": "NO_ARTIFACTS",
#    },
#    cache={
#        "type": "S3",
#        "location": example_bucket.bucket,
#    },
#    environment={
#        "compute_type": "BUILD_GENERAL1_SMALL",
#        "image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0",
#        "type": "LINUX_CONTAINER",
#        "image_pull_credentials_type": "CODEBUILD",
#        "environment_variables": [
#            {
#                "name": "SOME_KEY1",
#                "value": "SOME_VALUE1",
#            },
#            {
#                "name": "SOME_KEY2",
#                "value": "SOME_VALUE2",
#                "type": "PARAMETER_STORE",
#            },
#        ],
#    },
#    logs_config={
#        "cloudwatch_logs": {
#            "group_name": "log-group",
#            "stream_name": "log-stream",
#        },
#        "s3_logs": {
#            "status": "ENABLED",
#            "location": example_bucket.id.apply(lambda id: f"{id}/build-log"),
#        },
#    },
#    source={
#        "type": "GITHUB",
#        "location": "https://github.com/mitchellh/packer.git",
#        "git_clone_depth": 1,
#        "git_submodules_config": {
#            "fetch_submodules": True,
#        },
#    },
#    source_version="master",
#    vpc_config={
#        "vpc_id": example_aws_vpc["id"],
#        "subnets": [
#            example1["id"],
#            example2["id"],
#        ],
#        "security_group_ids": [
#            example1_aws_security_group["id"],
#            example2_aws_security_group["id"],
#        ],
#    },
#    tags={
#        "Environment": "Test",
#    })
#project_with_cache = aws.codebuild.Project("project-with-cache",
#    name="test-project-cache",
#    description="test_codebuild_project_cache",
#    build_timeout=5,
#    queued_timeout=5,
#    service_role=example_role.arn,
#    artifacts={
#        "type": "NO_ARTIFACTS",
#    },
#    cache={
#        "type": "LOCAL",
#        "modes": [
#            "LOCAL_DOCKER_LAYER_CACHE",
#            "LOCAL_SOURCE_CACHE",
#        ],
#    },
#    environment={
#        "compute_type": "BUILD_GENERAL1_SMALL",
#        "image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0",
#        "type": "LINUX_CONTAINER",
#        "image_pull_credentials_type": "CODEBUILD",
#        "environment_variables": [{
#            "name": "SOME_KEY1",
#            "value": "SOME_VALUE1",
#        }],
#    },
#    source={
#        "type": "GITHUB",
#        "location": "https://github.com/mitchellh/packer.git",
#        "git_clone_depth": 1,
#    },
#    tags={
#        "Environment": "Test",
#    })
#project_using_github_app = aws.codebuild.Project("project-using-github-app",
#    name="project-using-github-app",
#    description="gets_source_from_github_via_the_github_app",
#    service_role=codebuild_role.arn,
#    artifacts={
#        "type": "NO_ARTIFACTS",
#    },
#    environment={
#        "compute_type": "BUILD_GENERAL1_SMALL",
#        "image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0",
#        "type": "LINUX_CONTAINER",
#        "image_pull_credentials_type": "CODEBUILD",
#    },
#    source={
#        "type": "GITHUB",
#        "location": "https://github.com/codecowboydotio/swapi-json-server",
#        "auth": {
#            "type": "CODECONNECTIONS",
#            "resource": "arn:aws:codestar-connections:ap-southeast-2:469568072720:connection/guid-string",
#        },
#    })
