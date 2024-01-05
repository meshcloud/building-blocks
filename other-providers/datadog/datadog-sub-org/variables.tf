# Provider Information
#variable "datadog_api_key" {
#  type        = string
#  description = "Datadog API Key"
#}
#variable "datadog_app_key" {
#  type        = string
#  description = "Datadog Application Key"
#}

variable "datadog_url" {
  type        = string
  default     = "https://api.datadoghq.eu/"
  description = "Regional URL"
}

variable "datadog_child_organization_name" {
  type        = string
  description = "Name of the new Datadog Child Organization"
}