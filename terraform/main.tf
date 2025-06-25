terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile = "admin2"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  bucket_tag_name    = var.bucket_tag_name
  bucket_environment = var.bucket_environment
}


module "dynamodb" {
  source      = "./modules/dynamodb"
  name     = var.name
  hash_key  = var.hash_key
 billing_mode = var.billing_mode
}
module "lambda" {
  source                   = "./modules/lambda"
  lambda_execution_role_arn = aws_iam_role.lambda_execution_role.arn
  # Add any other required variables here
}

module "apigateway" {
  source         = "./modules/apigateway"
 get_lambda_arn    = module.lambda.get_lambda_arn
  insert_lambda_arn = module.lambda.insert_lambda_arn
  delete_lambda_arn = module.lambda.delete_lambda_arn
}


module "cloudfront" {
  source  = "./modules/cloudfront"
  domain_name = var.domain_name
  origin_id = var.origin_id
  bucket_name = var.bucket_name
  origin_access_control_id = var.origin_access_control_id
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

resource "aws_iam_role" "lambda_execution_role" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "dynamodb_full_access" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}


/*
output "s3_bucket" {
  value = module.s3.bucket_name
}

output "dynamodb_table" {
  value = module.dynamodb.table_name
}

output "apigateway_url" {
  value = module.apigateway.invoke_url
}

output "cloudfront_domain" {
  value = module.cloudfront.domain_name
}
*/