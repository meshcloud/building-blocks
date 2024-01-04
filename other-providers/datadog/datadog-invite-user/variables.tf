# Provider Information
variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
}
variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
}
variable "datadog_url" {
  type        = string
  default     = "https://api.datadoghq.eu/"
  description = "Regional URL"
}

variable "user_to_invite_mail" {
  type        = string
  description = "Email of the user to invite"
}

variable "user_to_invite_name" {
  type        = string
  description = "First- and Lastname of the user to invite"
}

variable "user_to_invite_role" {
  type        = string
  description = "Role of the user to invite"
  validation {
    condition     = contains(["Datadog Admin Role", "Datadog Read Only Role", "Datadog Standard Role"], var.user_to_invite_role)
    error_message = "The user_role must be either 'Datadog Admin Role', 'Datadog Read Only Role' or 'Datadog Standard Role'."
  }
}