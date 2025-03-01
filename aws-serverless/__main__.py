"""An AWS Python Pulumi program"""

import iam
import pulumi
import pulumi_aws as aws

var_lambda_name = "svk-lambda"
region = aws.config.region


##################
## S3 bucket for logs
##################

bucket = aws.s3.Bucket("svk-bucket",
  bucket = "svk-lambda-bucket",
  force_destroy=True,
)

bucket_ownership_controls = aws.s3.BucketOwnershipControls("svk-bucket-ownership",
  bucket = bucket.id,
  rule={
    "object_ownership": "BucketOwnerPreferred",
  }
)




##################
## Lambda Function
##################

# Create a Lambda function, using code from the `./app` folder.

lambda_func = aws.lambda_.Function(
    "mylambda",
    name=var_lambda_name,
    role=iam.lambda_role.arn,
    runtime="python3.8",
    handler="hello.handler",
    code=pulumi.AssetArchive({".": pulumi.FileArchive("./app")}),
    
#    s3_bucket = bucket.id,
)


####################################################################
##
## API Gateway REST API (API Gateway V1 / original)
##    /{proxy+} - passes all requests through to the lambda function
##
####################################################################




# Create the API Gateway Rest API, using a swagger spec.
rest_api = aws.apigateway.RestApi(
    "svk-api",
    description="svk-test-gw",
)

rest_api_resource = aws.apigateway.Resource("MyDemoResource",
    rest_api=rest_api.id,
    parent_id=rest_api.root_resource_id,
    path_part="{proxy+}")
rest_api_method = aws.apigateway.Method("MyDemoMethod",
    rest_api=rest_api.id,
    resource_id=rest_api_resource.id,
    http_method="ANY",
    authorization="NONE")

rest_api_integration = aws.apigateway.Integration("svk-api-Integration",
    rest_api=rest_api.id,
    resource_id=rest_api_resource.id,
    http_method=rest_api_method.http_method,
    integration_http_method="POST",
    type="AWS_PROXY",
    uri=lambda_func.invoke_arn
    )
rest_api_method = aws.apigateway.Method("svk-proxy-root",
    rest_api=rest_api.id,
    resource_id=rest_api.root_resource_id,
    http_method="ANY",
    authorization="NONE")

rest_api_integration = aws.apigateway.Integration("svk-lambda-root",
    rest_api=rest_api.id,
    resource_id=rest_api.root_resource_id,
    http_method=rest_api_method.http_method,
    integration_http_method="POST",
    type="AWS_PROXY",
    uri=lambda_func.invoke_arn
    )


## Create a deployment of the Rest API.
deployment = aws.apigateway.Deployment(
    "svk-api-deployment", 
    opts=pulumi.ResourceOptions(depends_on=[rest_api_integration]),
    rest_api=rest_api.id,
    stage_name="test",
)

# Give permissions from API Gateway to invoke the Lambda
rest_invoke_permission = aws.lambda_.Permission(
    "svk-api-rest-lambda-permission",
    action="lambda:invokeFunction",
    function=lambda_func.name,
    principal="apigateway.amazonaws.com",
    source_arn=rest_api.execution_arn
    #source_arn=deployment.execution_arn.apply(lambda arn: {arn} + "/*/*"),
)


pulumi.export(
    "svk-apigateway-rest-endpoint",
    deployment.invoke_url.apply(lambda url: url + "/{proxy+}"),
)
