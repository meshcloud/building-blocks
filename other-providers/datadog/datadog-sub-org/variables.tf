# Provider Information
variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
}
variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
}
variable "brand" {
  type        = string
  description = "Volkswagen Brand"
}
variable "datadog_child_organization_name" {
  type        = string
  description = "Name of the DATADOG Child Organization"
}