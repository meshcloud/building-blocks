variable "amount" {
  type        = string
  description = "The amount of monthly budget in USD"
}

variable "actual_threshold" {
  type        = string
  description = "The actual threshold to trigger the alert when it's reached"
}

variable "forecasted_threshold" {
  type        = string
  description = "The forecasted threshold to trigger the alert when it's reached"
}

variable "contact_email" {
  type        = list(string)
  description = "list of emails which should receive the budget alerts. e.g. ['devops@example.com']"
}
