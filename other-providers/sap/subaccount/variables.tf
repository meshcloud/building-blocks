variable "globalaccount" {
  type        = string
  description = "The subdomain of the global account in which you want to manage resources. To be found in the cockpit, in the global account view. Should look like '98d249c7trial-ga'"
}

variable "parent_id" {
  type        = string
  description = "ID of the account where this subaccount is going to created in, use global if there is no parent account"
  default     = ""
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
  default     = "us10"
}

variable "environment_instance_name" {
  type        = string
  description = "The name of the environment instance"
}

variable "instance_name" {
  type        = string
  description = "Part of Parameters which is The configuration for the environment instance. Should be unique"
}

variable "environment_type" {
  type        = string
  description = "The type of the environment instance that is used"
  default     = "cloudfoundry"
}

variable "service_name" {
  type        = string
  description = "The name of the service for the environment instance in the corresponding service broker's catalog"
  default     = "cloudfoundry"
}

variable "plan_name" {
  type        = string
  description = "The name of the service plan for the environment instance in the corresponding service broker's catalog. e.g. 'standard'"
  default     = "standard"
}
