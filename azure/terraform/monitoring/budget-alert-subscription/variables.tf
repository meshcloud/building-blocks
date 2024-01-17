variable "budget_name" {
  type        = string
  description = "Name of the budget alert rule"
  default     = "budget_alert"
}

variable "subscription_id" {
  type        = string
  description = "The ID of the subscription at which you want to assign the budget"
}

variable "contact_emails" {
  type        = list(string)
  description = "List of emails of the users who should receive the Budget alert. e.g. ['foo@example.com', 'bar@example.com']"
}

variable "monthly_budget_amount" {
  type        = number
  description = "Set the monthly budget goal for this subscription"
  default     = 100
}

variable "actual_threshold" {
  type        = string
  description = "The precise percentage of the monthly budget at which you wish to activate the alert upon reaching. E.g. '15' for 15% or '120' for 120%"
}

variable "forcasted_threshold" {
  type        = string
  description = "The forcasted percentage of the monthly budget at which you wish to activate the alert upon reaching. E.g. '15' for 15% or '120' for 120%"
}

variable "resource_group_for_action_group" {
  type        = string
  description = "the resource group holding the action group"
  default     = "rg-action-group"
}

variable "location" {
  type        = string
  description = "the location where resources will be deployes"
  default     = "germanywestcentral"

}
