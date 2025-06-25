
variable "domain_name" {
  description = "Domain name for the CloudFront distribution"
  type        = string
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

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  
}