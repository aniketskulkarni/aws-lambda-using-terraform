resource "aws_iam_role" "lambda_execution_role" {
  name = var.lambda_role_name
  assume_role_policy = file("lambda-execution-role.json")
}

resource "aws_iam_policy" "lambda_cloudwatch_policy" {
  name = var.lambda_policy_name
  policy = file("lambda-iam-policy.json")
}

resource "aws_iam_policy_attachment" "lambda_role_attachment" {
  name = var.lambda_role_name
  roles = [aws_iam_role.lambda_execution_role.name]
  policy_arn = aws_iam_policy.lambda_cloudwatch_policy.arn
}