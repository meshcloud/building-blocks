
# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "westeurope"
}

# Virtual Network, Subnets and Subnet NSG's

## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-default"
}

variable "subscription_id" {
  type        = string
  description = "You can use 'Platform Tenant ID' as the source for this input variable"
}


variable "project_identifier" {
  type        = string
  description = "Use 'Project Identifier' input source in meshStack for this variable"
}

variable "workspace_identifier" {
  type        = string
  description = "Use 'workspace Identifier' input source in meshStack for this variable"
}
