# From the users assigned to the project, extract only those with admin privileges.
locals {
  admins = { for user in var.users :
  user.username => user if contains(user["roles"], "admin") }
}

# Retrieve the ID of Datadog Admin Role from the new Datadog child org
data "datadog_role" "admuser" {
  provider   = datadog.newChildOrg
  filter     = "Datadog Admin Role"
  depends_on = [datadog_child_organization.organization]
}

# Create a new Datadog Child Organization
resource "datadog_child_organization" "organization" {
  lifecycle {
    precondition {
      condition     = var.approval == "Approved"
      error_message = "The process was terminated because the request did not receive approval."
    }
  }
  
  name = var.datadog_child_organization_name
}

# Configure the Datadog provider for newly created Datadog child organization
provider "datadog" {
  alias   = "newChildOrg"
  api_key = datadog_child_organization.organization.api_key[0].key
  app_key = datadog_child_organization.organization.application_key[0].hash
  validate = false
}

# Assign Admin role for newly created Datadog child organization to users having admin role in the current project
resource "datadog_user" "admusers" {
  lifecycle {
    precondition {
      condition     = var.approval == "Approved"
      error_message = "The process was terminated because the request did not receive approval."
    }
  }

  provider             = datadog.newChildOrg
  for_each             = local.admins
  email                = each.key
  name                 = join(" ", [each.value["firstName"], each.value["lastName"]])
  roles                = [data.datadog_role.admuser.id]
  send_user_invitation = false
}