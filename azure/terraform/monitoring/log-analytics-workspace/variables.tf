variable "subscription_id" {
  type        = string
  description = "Subscription ID for deployment of the resources"
}
variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource group location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to deploy resources in."
}
