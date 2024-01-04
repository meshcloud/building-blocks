# Datadog part
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

variable "workspace_id" {
  type        = string
  description = "meshStack workspace ID"
}

variable "project_id" {
  type        = string
  description = "meshStack project ID"
}

variable "tenant_id" {
  type        = string
  description = "meshStack tenant ID to integrate with Datadog"
}

variable "child_org_name" {
  type        = string
  description = "Name of Datadog child organization where aws account will be integrated"
}

# AWS part

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

#variable "aws_access_key" {
#  type = string
#  description = "Access key to allow terraform to apply changes in the aws account"
#}

#variable "aws_secret_key" {
#  type = string
#  description = "Secret to allow terraform to apply changes in the aws account"
#}

variable "datadog_role_name" {
  type        = string
  default     = "DatadogAWSIntegrationRole"
  description = "Name of the role assumed by Datadog to pull data from AWS accounts"
}

variable "datadog_aws_account" {
  type        = string
  default     = "464622532012"
  description = "Datadog AWS account used to collect data from AWS accounts"
}