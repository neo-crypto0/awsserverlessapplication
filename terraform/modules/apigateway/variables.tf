variable "get_lambda_arn" {
  description = "ARN of the Lambda function for GET"
  type        = string
}
variable "insert_lambda_arn" {
  description = "ARN of the Lambda function for POST"
  type        = string
}
variable "delete_lambda_arn" {
  description = "ARN of the Lambda function for DELETE"
  type        = string
}
variable "aws_region" {
  description = "AWS region where the API Gateway and Lambda functions are deployed"
  type        = string
  default     = "us-east-1"
}