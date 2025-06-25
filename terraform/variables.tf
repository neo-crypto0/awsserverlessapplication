variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default = "my-terraform-bucket-20252025"
}
variable "bucket_tag_name" {
  description = "Tag: Name for the S3 bucket"
  type        = string
  default     = "my-terraform-bucket"

}

variable "bucket_environment" {
  description = "Tag: Environment for the S3 bucket"
  type        = string
  default     = "dev"
}


variable "name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "employeedb"
}

variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  type        = string
  default     = "employeeid"
}
variable "billing_mode" {
  description = "Billing mode for the DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "domain_name" {
  description = "Domain name for the CloudFront distribution"
  type        = string
  default     = "my-terraform-bucket-20252025.s3.us-east-1.amazonaws.com"
  
}
variable "origin_id" {
  description = "Origin ID for the S3 bucket in CloudFront"
  type        = string
  default     = "S3Origin"
}

variable "origin_access_control_id" {
  description = "Origin Access Control ID for the CloudFront distribution"
  type        = string
  default     = "S3-OAC"
}
/*
variable "api_name" {
  description = "Name for the API Gateway"
  type        = string
}

variable "lambda_arn" {
  description = "ARN of the Lambda function for API Gateway integration"
  type        = string
}
*/