terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_key
  secret_key = var.aws_secret
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "main.py"
  output_path = "lambda_main.py.zip"
}

resource "aws_lambda_function" "hello_world" {
  filename      = "lambda_main.py.zip"
  function_name = "main"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main.hello_world"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.11"
}
