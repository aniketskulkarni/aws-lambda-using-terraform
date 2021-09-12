resource "aws_lambda_function" "hello_world_lambda" {
  function_name = var.lambda_function_name
  filename = "../files/${var.lambda_package_filename}"
  role = aws_iam_role.lambda_execution_role.arn
  handler = var.lambda_handler
  runtime = var.lambda_runtime
  source_code_hash = filebase64sha256("../files/${var.lambda_package_filename}")
}
