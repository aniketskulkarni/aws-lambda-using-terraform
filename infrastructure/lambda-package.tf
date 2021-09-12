data "archive_file" "lambda_package" {
  type = "zip"
  source_file = "../lambda-source-code/hello_world.py"
  output_path = "../files/${var.lambda_package_filename}"
}