output "lambda_function_name" {
  value = aws_lambda_function.hello_world_lambda.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.hello_world_lambda.arn
}

output "lambda_function_invoke_arn" {
  value = aws_lambda_function.hello_world_lambda.invoke_arn
}

output "apigateway_base_url" {
  description = "Base URL for API Gateway stage."
  value = aws_apigatewayv2_stage.serverless_api_stage.invoke_url
}
