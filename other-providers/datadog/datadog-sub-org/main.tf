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

# Onboard project users as Datadog users
# No changes for a user already having a role in Dadadog
locals {
  admins = { for user in var.users :
    user.username => user if contains(user["roles"], "admin") }
  
  users = { for user in var.users : 
    user.username => user if contains(user["roles"], "user") }
  
  readers = { for user in var.users :
    user.username => user if contains(user["roles"], "reader")}
}

data "datadog_role" "stduser" {
  provider = datadog.newChildOrg
  filter = "Datadog Standard Role"
  depends_on = [datadog_child_organization.organization]
}

data "datadog_role" "rouser" {
  provider = datadog.newChildOrg
  filter = "Datadog Read Only Role"
  depends_on = [datadog_child_organization.organization]
}

data "datadog_role" "admuser" {
  provider = datadog.newChildOrg
  filter = "Datadog Admin Role"
  depends_on = [datadog_child_organization.organization]
}

# Project read only are mapped to Datadog Read Only Role
resource "datadog_user" "readers" {
  provider = datadog.newChildOrg
  for_each = local.readers
  email    = each.key
  name     = join(" ", [each.value["firstName"],each.value["lastName"]])
  roles = [data.datadog_role.rouser.id]
  send_user_invitation = false
}

# Project users are mapped to Datadog Standard Role
resource "datadog_user" "stdusers" {
  provider = datadog.newChildOrg
  for_each = local.users
  email    = each.key
  name     = join(" ", [each.value["firstName"],each.value["lastName"]])
  roles = [data.datadog_role.stduser.id]
  send_user_invitation = false
}

# Project admins are mapped to Datadog Admin Role
resource "datadog_user" "admusers" {
  provider = datadog.newChildOrg
  for_each = local.admins
  email    = each.key
  name     = join(" ", [each.value["firstName"],each.value["lastName"]])
  roles = [data.datadog_role.admuser.id]
  send_user_invitation = false
}