variable "environment_name" {
  type    = string
  default = "dev"
}

variable "context_prefix" {
  type    = string
  default = "ms"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for deployment of the resources"
}

variable "location" {
  type        = string
  default     = "west europe"
  description = "Location of the Resource group and other resources created by this module"
}
