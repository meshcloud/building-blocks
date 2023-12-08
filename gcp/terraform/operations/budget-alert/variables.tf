variable "projectid" {
  type        = string
  description = "Id of the project you want to specify this budget alert for"
}

variable "billing_account" {
  type        = string
  description = "billing account id for your project's organization"
}

variable "budget_amount" {
  type        = string
  description = "The amount of monthly Budget specified for this project"
}

variable "alert_treshold" {
  type        = string
  description = "Ratio of the budget amount that you want to receive an alert when it reached. e.g. '0.5' means 50%"
}
