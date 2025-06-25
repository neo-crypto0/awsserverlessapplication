variable "name" {
  description = "Name of the DynamoDB table"
  type        = string
  
}
variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  type        = string
}
variable "billing_mode" {
  description = "Read capacity units for the DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"
  
}
