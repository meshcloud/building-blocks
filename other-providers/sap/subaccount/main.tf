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
