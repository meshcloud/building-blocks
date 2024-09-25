variable "ec2_size" {
  type        = string
  description = "Provide a name of AWS EC2 instance size such as t2.micro, etc."
  default     = "t2.micro"
}

#variable "ec2_sshpub_key" {
#    type = string
#    description = "To connect to the instance via you existing SSH key, please provide a public part of the key."
#}

variable "ec2_storage_size" {
  type        = number
  description = "Provide size of storage volume in Gb"
  default     = 8
}

variable "ec2_subnet_id" {
  type        = string
  description = "Provide the subnet ID where the EC2 will be placed"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "ec2_name" {
  type        = string
  description = "The name set as value for the tag Name"
}