"""An AWS Python Pulumi program"""

import iam
import pulumi
import pulumi_aws as aws

config = pulumi.Config()
project = config.get("project")
name_prefix = config.get("name-prefix")
var_lambda_name = config.get("lambda-name")
region = aws.config.region


##################
## Lambda Function
##################

# Create a Lambda function, using code from the `./app` folder.

lambda_func = aws.lambda_.Function(
  name_prefix + "-" + project + "-" + var_lambda_name,
  name=name_prefix + "-" + project + "-" + var_lambda_name,
  role=iam.lambda_role.arn,
  runtime="python3.8",
  handler="hello.handler",
  code=pulumi.AssetArchive({".": pulumi.FileArchive("./app")}),
)

#log_group = aws.cloudwatch.LogGroup(
#  name_prefix + "-" + project + "-" + var_lambda_name,
#  name="/aws/lambda/" + var_lambda_name,
#  retention_in_days=5,
#)


####################################################################
##
## API Gateway REST API (API Gateway V1 / original)
##    /{proxy+} - passes all requests through to the lambda function
##
####################################################################




# Create the API Gateway Rest API, using a swagger spec.
rest_api = aws.apigateway.RestApi(
    name_prefix + "-" + project + "-api-gw",
    name=name_prefix + "-" + project + "-api-gw",
    description="svk-test-gw",
)

rest_api_resource = aws.apigateway.Resource(
    name_prefix + "-" + project + "-proxy-resource",
    rest_api=rest_api.id,
    parent_id=rest_api.root_resource_id,
    path_part="{proxy+}")

rest_api_method = aws.apigateway.Method(
    name_prefix + "-" + project + "-method",
    rest_api=rest_api.id,
    resource_id=rest_api_resource.id,
    http_method="ANY",
    authorization="NONE")

rest_api_integration = aws.apigateway.Integration(
    name_prefix + "-" + project + "-integration",
    rest_api=rest_api.id,
    resource_id=rest_api_resource.id,
    http_method=rest_api_method.http_method,
    integration_http_method="POST",
    type="AWS_PROXY",
    uri=lambda_func.invoke_arn
    )


rest_api_method_root = aws.apigateway.Method(
    name_prefix + "-" + project + "-proxy-root",
    opts=pulumi.ResourceOptions(depends_on=[rest_api]),
    rest_api=rest_api.id,
    resource_id=rest_api.root_resource_id,
    http_method="ANY",
    authorization="NONE")
rest_api_integration_root = aws.apigateway.Integration(
  name_prefix + "-" + project + "-integration-root",
  rest_api=rest_api.id,
  resource_id=rest_api.root_resource_id,
  http_method=rest_api_method.http_method,
  integration_http_method="POST",
  type="AWS_PROXY",
  uri=lambda_func.invoke_arn
)


## Create a deployment of the Rest API.
deployment = aws.apigateway.Deployment(
  name_prefix + "-" + project + "-deployment",
  opts=pulumi.ResourceOptions(depends_on=[rest_api_integration, rest_api_integration_root]),
  rest_api=rest_api.id,
  stage_name="",
)

stage = aws.apigateway.Stage(
  name_prefix + "-" + project + "-stage",
  opts=pulumi.ResourceOptions(depends_on=[deployment]),
  rest_api=rest_api.id,
  deployment = deployment.id,
  stage_name = "test",
)

# Give permissions from API Gateway to invoke the Lambda
rest_invoke_permission = aws.lambda_.Permission(
  name_prefix + "-" + project + "-" + var_lambda_name + "-permission",
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
