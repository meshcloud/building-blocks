variable "subnet_name" {
}

variable "resource_group_id" {
}

variable "name" {
}

variable "admin_username" {
}

variable "admin_ssh_public_key" {
}

variable "size" {
  type = string
  default = "Standard_A1_v2"
}

variable "storage" {
  type    = number
  default = 0
}
