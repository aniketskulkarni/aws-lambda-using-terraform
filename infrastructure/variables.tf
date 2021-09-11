variable "region" {
  default = "eu-north-1"
}

variable "aws_profile" {
  default = "learnwithaniket"
}

variable "lambda_role_name" {
  default = "hello-world-lambda-execution-role"
}

variable "lambda_policy_name" {
  default = "hello-world-lambda-cloudwatch-policy"
}

variable "lambda_function_name" {
  default = "hello-world-function"
}

variable "lambda_runtime" {
  default = "python3.7"
}

variable "lambda_handler" {
  default = "hello_world.lambda_handler"
}

variable "lambda_package_filename" {
  default = "hello-world-lambda.zip"
}