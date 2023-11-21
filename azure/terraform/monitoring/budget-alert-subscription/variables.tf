
variable "location" {
  type    = string
  default = "westeurope"
}

variable "budget_name" {
  type    = string
  default = "budget_alert"
}

variable "subscription_id" {
  type        = string
  description = "The ID of the subscription at which you want to assign the budget"
}

variable "resource_group_for_action_group_name" {
  type        = string
  description = "The name of the resource group to deploy the action group inside"
  default     = "rg_action_group"
}

variable "end_date" {
  type        = string
  description = "End date of the budget rule, Timestamp in the format YYYY-MM-DDTHH:MM:SSZ"
  validation {
    condition     = can(regex("^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T\\d{2}:\\d{2}:\\d{2}Z$", var.end_date))
    error_message = "Timestamp must be in the format YYYY-MM-DDTHH:MM:SSZ"
  }
}

variable "start_date" {
  type        = string
  description = "Start date of the budget rule, should be first day of the month"
  validation {
    condition     = can(regex("^\\d{4}-(0[1-9]|1[0-2])-(01)T\\d{2}:\\d{2}:\\d{2}Z$", var.start_date))
    error_message = "The 'start_date' must be in the format 'YYYY-MM-01THH:MM:SSZ', e.g., '2023-11-01T00:00:00Z'."
  }
}

variable "contact_emails" {
  type        = list(string)
  description = "List of emails of the users who should receive the Budget alert. e.g. ['foo@example.com', 'bar@example.com']"
}

