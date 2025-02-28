"""An AWS Python Pulumi program"""

import iam
import pulumi
import pulumi_aws as aws

var_lambda_name = "svk-lambda"
region = aws.config.region

custom_stage_name = "example"

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

#
## Create a deployment of the Rest API.
#deployment = aws.apigateway.Deployment(
#    "api-deployment",
#    rest_api=rest_api.id,
#    # Note: Set to empty to avoid creating an implicit stage, we'll create it
#    # explicitly below instead.
#    stage_name="",
#)
#
## Create a stage, which is an addressable instance of the Rest API. Set it to point at the latest deployment.
#stage = aws.apigateway.Stage(
#    "api-stage",
#    rest_api=rest_api.id,
#    deployment=deployment.id,
#    stage_name=custom_stage_name,
#)
#
## Give permissions from API Gateway to invoke the Lambda
#rest_invoke_permission = aws.lambda_.Permission(
#    "api-rest-lambda-permission",
#    action="lambda:invokeFunction",
#    function=lambda_func.name,
#    principal="apigateway.amazonaws.com",
#    source_arn=deployment.execution_arn.apply(lambda arn: {arn} + "*/*"),
#)
#
##########################################################################
## Create an HTTP API and attach the lambda function to it
###    /{proxy+} - passes all requests through to the lambda function
###
##########################################################################
#
#http_endpoint = aws.apigatewayv2.Api("http-api-pulumi-example", protocol_type="HTTP")
#
#http_lambda_backend = aws.apigatewayv2.Integration(
#    "example",
#    api_id=http_endpoint.id,
#    integration_type="AWS_PROXY",
#    connection_type="INTERNET",
#    description="Lambda example",
#    integration_method="POST",
#    integration_uri=lambda_func.arn,
#    passthrough_behavior="WHEN_NO_MATCH",
#)
#
#url = http_lambda_backend.integration_uri
#
#http_route = aws.apigatewayv2.Route(
#    "example-route",
#    api_id=http_endpoint.id,
#    route_key="ANY /{proxy+}",
#    target=http_lambda_backend.id.apply(lambda targetUrl: "integrations/" + targetUrl),
#)
#
#http_stage = aws.apigatewayv2.Stage(
#    "example-stage",
#    api_id=http_endpoint.id,
#    route_settings=[
#        {
#            "route_key": http_route.route_key,
#            "throttling_burst_limit": 1,
#            "throttling_rate_limit": 0.5,
#        }
#    ],
#    auto_deploy=True,
#)
#
## Give permissions from API Gateway to invoke the Lambda
#http_invoke_permission = aws.lambda_.Permission(
#    "api-http-lambda-permission",
#    action="lambda:invokeFunction",
#    function=lambda_func.name,
#    principal="apigateway.amazonaws.com",
#    source_arn=http_endpoint.execution_arn.apply(lambda arn: arn + "*/*"),
#)
#
## Export the https endpoint of the running Rest API
#pulumi.export(
#    "apigateway-rest-endpoint",
#    deployment.invoke_url.apply(lambda url: url + custom_stage_name + "/{proxy+}"),
#)
## See "Outputs" for (Inputs and Outputs)[https://www.pulumi.com/docs/intro/concepts/inputs-outputs/] the usage of the pulumi.Output.all function to do string concatenation
#pulumi.export(
#    "apigatewayv2-http-endpoint",
#    pulumi.Output.all(http_endpoint.api_endpoint, http_stage.name).apply(
#        lambda values: values[0] + "/" + values[1] + "/"
#    ),
#)
