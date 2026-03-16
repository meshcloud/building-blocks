variable "aws_region" {
  description = "The AWS region to deploy the VPC"
  type        = string
  default     = "eu-central-1"
}

variable "target_aws_account_id" {
  description = "The specific AWS Account ID allowed for this deployment"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}