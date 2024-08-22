resource "random_pet" "suffix" {
  length = 1
}

resource "azuredevops_project" "terraform_ado_project" {
  name               = "${var.project_name}-${random_pet.suffix.id}"
  description        = var.description
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
  # Enable or desiable the DevOps fetures below (enabled / disabled)
  features = {
    "boards"       = "enabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "enabled"
    "artifacts"    = "enabled"
  }
}

resource "azuredevops_serviceendpoint_github" "serviceendpoint_github" {
  project_id            = azuredevops_project.terraform_ado_project.id
  service_endpoint_name = "Sample GithHub Personal Access Token"

  auth_personal {
    # Also can be set with AZDO_GITHUB_SERVICE_CONNECTION_PAT environment variable
    # personal_access_token = "XXXXXXXXXXXXXXXXXXXXXXXX"
  }
}

# create limted ADO Project admin group
resource "azuredevops_group" "admin_group" {
  scope        = azuredevops_project.devops_project.id
  display_name = "Admin Group"
  description  = "DevOps Project Administrator Group"
}

resource "azuredevops_project_permissions" "admin_group_permission" {
  project_id = azuredevops_project.devops_project.id
  principal  = azuredevops_group.admin_group.id
  permissions = {
    DELETE = "Deny"
    RENAME = "Deny"
  }
}

# Get the default reader group for the project
data "azuredevops_group" "reader_group" {
  project_id = azuredevops_project.devops_project.id
  name       = "Readers"
}

# Get the default user group for the project
data "azuredevops_group" "user_group" {
  project_id = azuredevops_project.devops_project.id
  name       = "Contributors"
}

# iterate through the list of users and redue to a map of user with only their euid
locals {
  all_users    = { for user in var.users : user.euid => user }
  reader_users = { for user in var.users : user.euid => user if contains(user.roles, "reader") }
  admin_users  = { for user in var.users : user.euid => user if contains(user.roles, "admin") }
  user_users   = { for user in var.users : user.euid => user if contains(user.roles, "user") }
}
# Assign Users to the specific Azure DevOps Groups
resource "azuredevops_group_membership" "admin_user_group_assignmnet" {
    depends_on = [azuredevops_group.admin_group]

  for_each = data.azuredevops_users.admin
  group = azuredevops_group.admin_group.id
  members = [
    tolist(each.value.users)[0].descriptor
  ]
}

resource "azuredevops_group_membership" "user_user_group_assignmnet" {
    depends_on = [data.azuredevops_group.user_group]

  for_each = data.azuredevops_users.user
  group = data.azuredevops_group.user_group.id
  members = [
    tolist(each.value.users)[0].descriptor
  ]
}

resource "azuredevops_group_membership" "reader_user_group_assignmnet" {
    depends_on = [data.azuredevops_group.reader_group]

  for_each = data.azuredevops_users.reader
  group = data.azuredevops_group.reader_group.id
  members = [
    tolist(each.value.users)[0].descriptor
  ]
}