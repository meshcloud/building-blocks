variable "vpc_id" {
    type = string
    description = "Id of the VPC where the subnet has to be provisioned"
}

variable "cidr_block" {
    type = string
    description = "IP range for a subnet"
}

variable "aws_region" {
    type = string
    description = "The region where the subnet has to be created"
    default = "eu-central-1"
}

variable "aws_az" {
    type = string
    description = "Single char ID of an availability zone i.e. 'a' for eu-central-1a"
}

variable "public_ip" {
    type = bool
    description = "Whether the subnet should provision public IP or not for the deployed instances"
}