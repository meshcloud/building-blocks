# Bastion Linux VM Input Variables Placeholder file.
variable "bastion_service_subnet_name" {
  description = "Bastion Service Subnet Name"
  default     = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address Prefixes"
  default     = ["10.0.101.0/27"]
}

# Generic Input Variables
# Business Division
variable "business_divsion" {
  description = "Business Division in the organization this Infrastructure belongs"
  type        = string
  default     = "cloud_infra"
}
# Environment Variable
variable "environment" {
  description = "Environment name used as a prefix"
  type        = string
  default     = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-default"
}

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
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}


#  Subnet Name
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type        = string
  default     = "subnet"
}
#  Subnet Address Space
variable "subnet_address" {
  description = "Virtual Network Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}


# Bastion / Management Subnet Name
variable "bastion_subnet_name" {
  description = "Virtual Network Bastion Subnet Name"
  type        = string
  default     = "bastionsubnet"
}
# Bastion / Management Subnet Address Space
variable "bastion_subnet_address" {
  description = "Virtual Network Bastion Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.100.0/24"]
}


