"""An AWS Python Pulumi program"""

import iam
import pulumi
import pulumi_aws as aws

var_lambda_name = "svk-lambda"
region = aws.config.region


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
)

log_group = aws.cloudwatch.LogGroup("svk-lambda-func",
    #name="/aws/lambda/" + str(lambda_func.name),
    #name=lambda_func.name.apply(lambda name: "/aws/lambda" + {str(name)}),
    name="/aws/lambda/svk-lambda",
    tags={
        "Environment": "production",
        "Application": "serviceA",
    })


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


rest_api_method_root = aws.apigateway.Method("svk-proxy-root",
    opts=pulumi.ResourceOptions(depends_on=[rest_api]),
    rest_api=rest_api.id,
    resource_id=rest_api.root_resource_id,
    http_method="ANY",
    authorization="NONE")
rest_api_integration_root = aws.apigateway.Integration("svk-lambda-root",
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
    opts=pulumi.ResourceOptions(depends_on=[rest_api_integration, rest_api_integration_root]),
    rest_api=rest_api.id,
    stage_name="",
    #triggers=
)

stage = aws.apigateway.Stage(
  "svk-api-stage",
  opts=pulumi.ResourceOptions(depends_on=[deployment]),
  rest_api=rest_api.id,
  deployment = deployment.id,
  stage_name = "test",
)

# Give permissions from API Gateway to invoke the Lambda
rest_invoke_permission = aws.lambda_.Permission(
    "svk-api-rest-lambda-permission",
    statement_id  = "AllowAPIGatewayInvoke",
    action="lambda:invokeFunction",
    function=lambda_func.name,
    principal="apigateway.amazonaws.com",
    source_arn=rest_api.execution_arn.apply(lambda arn: arn + "/*/*"),
)


pulumi.export(
    "svk-apigateway-rest-endpoint",
    deployment.invoke_url.apply(lambda url: url + f"test"),
)
pulumi.export(
    "api-stuff",
    rest_api
)
pulumi.export(
    "lambda-stuff",
    lambda_func
)
