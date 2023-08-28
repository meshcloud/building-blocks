variable "globalaccount" {
  type        = string
  description = "The subdomain of the global account in which you want to manage resources. To be found in the cockpit, in the global account view."
}

variable "parent_id" {
  type        = string
  description = "ID of the account where this subaccount is going to created in, use global if there is no parent account"
}

variable "subaccount_name" {
  type        = string
  description = " A descriptive name of the subaccount for customer-facing UIs."
}

variable "subaccount_subdomain" {
  type        = string
  description = "The subdomain that becomes part of the path used to access the authorization tenant of the subaccount. Must be unique within the defined region and cannot be changed after the subaccount has been created."
}

variable "subaccount_region" {
  type        = string
  description = "The region in which the subaccount was created."
}
