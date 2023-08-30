# Look up all regions via data source
data "btp_regions" "all" {}

# create a subaccount in a region
resource "btp_subaccount" "my_project" {

  name      = var.subaccount_name
  subdomain = var.subaccount_subdomain
  region    = var.subaccount_region

  description = "test subaccount"


  # The ID of the subaccount’s parent entity.
  # If the subaccount is located directly in the global account (not in a directory), then this is the ID of the global account.
  # parent_id = var.parent_id

  # Shows whether the subaccount is used for production purposes
  # values can be: "UNSET", "NOT_USED_FOR_PRODUCTION", "USED_FOR_PRODUCTION"
  usage = "UNSET"
}

resource "btp_subaccount_environment_instance" "cloudfoundry" {
  subaccount_id    = btp_subaccount.my_project.id
  name             = var.environment_instance_name
  environment_type = var.environment_type
  service_name     = var.service_name
  plan_name        = var.plan_name

  # some regions offer multiple environments of a kind and you must explicitly select the target environment in which
  # the instance shall be created. 
  # available environments can be looked up using the btp_subaccount_environments datasource
  parameters = jsonencode({
    instance_name = "${var.instance_name}"
  })
}
