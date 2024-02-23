resource "random_string" "unique" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

# Create a new Datadog Child Organization
resource "datadog_child_organization" "organization" {
  name = var.datadog_child_organization_name
}

# Configure the Datadog provider
provider "datadog" {
  alias    = "newChildOrg"
  api_key  = datadog_child_organization.organization.api_key[0].key
  app_key  = datadog_child_organization.organization.application_key[0].hash
  api_url  = var.datadog_url
  validate = false
}

# Onboard project admin users as Datadog users with admin role
locals {
  admins = { for user in var.users :
  user.username => user if contains(user["roles"], "admin") }
}

data "datadog_role" "admuser" {
  provider   = datadog.newChildOrg
  filter     = "Datadog Admin Role"
  depends_on = [datadog_child_organization.organization]
}

# Project admins are mapped to Datadog Admin Role
resource "datadog_user" "admusers" {
  provider             = datadog.newChildOrg
  for_each             = local.admins
  email                = each.key
  name                 = join(" ", [each.value["firstName"], each.value["lastName"]])
  roles                = [data.datadog_role.admuser.id]
  send_user_invitation = false
}