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

variable "users" {
  type = list(object(
    {
      meshIdentifier = string
      username       = string
      firstName      = string
      lastName       = string
      email          = string
      euid           = string
      roles          = list(string)
    }
  ))
  description = "Users and their roles provided by meshStack"
}