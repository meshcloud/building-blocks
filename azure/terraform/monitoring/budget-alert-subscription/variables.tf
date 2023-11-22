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


// Uncomment next 2 variables if you want to change the start and end date via inputs --------------------------------
# variable "end_date" {
#   type        = string
#   description = "End date of the budget rule, Timestamp in the format YYYY-MM-DDTHH:MM:SSZ"
#   validation {
#     condition     = can(regex("^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T\\d{2}:\\d{2}:\\d{2}Z$", var.end_date))
#     error_message = "Timestamp must be in the format YYYY-MM-DDTHH:MM:SSZ"
#   }
# }

# variable "start_date" {
#   type        = string
#   description = "Start date of the budget rule, should be first day of the month. Timestamp in the format YYYY-MM-DDTHH:MM:SSZ"
#   validation {
#     condition     = can(regex("^\\d{4}-(0[1-9]|1[0-2])-(01)T\\d{2}:\\d{2}:\\d{2}Z$", var.start_date))
#     error_message = "The 'start_date' must be in the format 'YYYY-MM-01THH:MM:SSZ', e.g., '2023-11-01T00:00:00Z'."
#   }
# }
//------------------------------------------------------------------------------------------------------------------------
