resource "random_string" "unique" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

data "datadog_role" "default_user" {
  filter = "Datadog Admin Role"
}

# Create a new Datadog user
resource "datadog_user" "new_user" {
  email = var.user_to_invite_mail
  name = var.user_to_invite_name
  roles = [data.datadog_role.default_user.id]
  send_user_invitation = true
}