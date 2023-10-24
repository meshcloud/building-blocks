variable "scope_management_group_id" {
  type = string
}

variable "budget_name" {
  type = string
}

variable "end_date" {
  type        = string
  description = "Staring date of the budget rule, should be first day of the month"
  validation {
    condition     = can(regex("^(\\d{4}-11-01T\\d{2}:\\d{2}:\\d{2}Z)$", var.end_date))
    error_message = "The 'end_date' must be in the format 'YYYY-11-01THH:MM:SSZ', e.g., '2023-11-01T00:00:00Z'."
  }
}

variable "start_date" {
  type        = string
  description = "Staring date of the budget rule, should be first day of the month"
  validation {
    condition     = can(regex("^(\\d{4}-11-01T\\d{2}:\\d{2}:\\d{2}Z)$", var.start_date))
    error_message = "The 'start_date' must be in the format 'YYYY-11-01THH:MM:SSZ', e.g., '2023-11-01T00:00:00Z'."
  }
}

variable "resource_group_for_action_group_name" {
  type = string
}

variable "contact_emails" {
  type = list(string)
  default = [
    "foo@example.com",
    "bar@example.com",
  ]
}

variable "scope_subscription_id" {
  type = string
}


variable "scope_rg_name" {
  type = string
}

variable "budget_scope_level" {
  type        = string
  description = "The type of resource (rg for Resource Group, sub for Subscription, or 'mgmt' for Management Group)"
  validation {
    condition     = can(regex("^(rg|sub|mgmt)$", var.budget_scope_level))
    error_message = "Valid values are 'rg' for Resource Group, 'sub' for Subscription, or 'mgmt' for Management Group."
  }
}
