
# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name. This is dependent to the output of standard-vnet building block."
  type        = string
  default     = "rg-default"
}

## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name. This is dependent to the output of standard-vnet building block."
  type        = string
  default     = "vnet-default"
}

variable "subscription_id" {
  type        = string
  description = "You can use 'Platform Tenant ID' as the source for this input variable"
}


