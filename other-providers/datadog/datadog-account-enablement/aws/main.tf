resource "random_string" "unique" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

# Create a list of Cloud Accounts based on the string input
locals {
  aws_accounts_list = split(";",var.aws_accounts_string)
}

# Create a new Datadog - Amazon Web Services integration
resource "datadog_integration_aws" "onboarding" {
  for_each = toset(local.aws_accounts_list)
  account_id  = each.key
  role_name   = "DatadogAWSIntegrationRole"
#  filter_tags = ["key:value"]
  host_tags   = ["workspaceid:${var.workspace_id}", "projectid:${var.project_id}"]
  account_specific_namespace_rules = {
    auto_scaling = false
    opsworks     = false
  }
#  excluded_regions = ["us-east-1", "us-west-2"]
}