variable "cidr_block" {
  type        = string
  description = "IP range for a new VPC"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_name" {
  type        = string
  description = "The name set as value for the tag Name"
}