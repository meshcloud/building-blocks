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
  default = "https://api.datadoghq.eu/"
  description = "Regional URL"
}

variable "user_to_invite_mail" {
  type        = string
  default = "email@meshcloud.io"
  description = "Email of the user to invite"
}
variable "user_to_invite_name" {
  type        = string
  default = "UserName"
  description = "First- and Lastname of the user to invite"
}
