provider "archive" {}

provider "aws" {
  region = var.region
  profile = var.aws_profile
  default_tags {
    tags = {
      Name = "aws-lambda-using-terraform"
      Owner = "learnwithaniket.com"
    }
  }
}