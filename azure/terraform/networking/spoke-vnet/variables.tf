variable "location" {
  description = "Location of the network"
  type        = string
  default     = "WestEurope"
}

variable "vnet_prefix" {
  description = "Prefix of the created VNET. It will be used as a base name for the created VNET, Resource Group, etc."
  type        = string
  default     = "cf"
}

variable "address_space_workload" {
  description = "The address space in CIDR notation for your workload subnets. For example 10.1.0.0/25"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.address_space_workload))
    error_message = "address_space_workload must be a valid CIDR range"
  }
}

variable "hub_subscription_id" {
  description = "Subscription ID of the subscription, the network hub is located in."
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID of the subscription the network shall be created in."
  type        = string
}


