terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  access_key = var.aws_key
  secret_key = var.aws_secret
}