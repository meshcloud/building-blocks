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

variable "aws_accounts_string" {
  type        = string
  description = "String with multiple AWS accounts separated with ;"
}

variable "workspace_id" {
  type        = string
  description = "meshStack workspace ID"
}
variable "project_id" {
  type        = string
  description = "meshStack project ID"
}