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