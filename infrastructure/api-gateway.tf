resource "aws_apigatewayv2_api" "serverless_api" {
  name = var.api_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "serverless_api_stage" {
  api_id = aws_apigatewayv2_api.serverless_api.id
  name = var.api_stage_name
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "hello_world_lambda" {
  api_id = aws_apigatewayv2_api.serverless_api.id
  integration_type = "AWS_PROXY"
  integration_method = "POST"
  integration_uri = aws_lambda_function.hello_world_lambda.invoke_arn
}

resource "aws_apigatewayv2_route" "hello_world" {
  api_id = aws_apigatewayv2_api.serverless_api.id
  route_key = "GET /hello-world"
  target = "integrations/${aws_apigatewayv2_integration.hello_world_lambda.id}"
}

resource "aws_lambda_permission" "apigateway_permission" {
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello_world_lambda.function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.serverless_api.execution_arn}/*/*"
}
