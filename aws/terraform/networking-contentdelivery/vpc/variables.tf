variable "cidr_block" {
    type = string
    description = "IP range for a new VPC"
}

variable "aws_region" {
    type = string
    default = "eu-central-1"
}