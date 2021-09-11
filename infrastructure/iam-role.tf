resource "aws_iam_role" "lambda-execution-role" {
  name = var.lambda_role_name
  assume_role_policy = file("lambda-execution-role.json")
}

resource "aws_iam_policy" "lambda-cloudwatch-policy" {
  name = var.lambda_policy_name
  policy = file("lambda-iam-policy.json")
}

resource "aws_iam_policy_attachment" "lambda-role-attachment" {
  name = var.lambda_role_name
  roles = [aws_iam_role.lambda-execution-role.name]
  policy_arn = aws_iam_policy.lambda-cloudwatch-policy.arn
}