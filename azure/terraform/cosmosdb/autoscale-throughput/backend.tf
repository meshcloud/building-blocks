terraform {
  backend "azurerm" {
    # *** The following values should be pass to the terraform via Environment_Variables ***
    # *** To do so, Add these keys as "Input Variables" and choose "Environment" in "Provide as" field 

    # information of the storage account and the blob holding the terraform state file
    tenant_id            = "703c8d27-13e0-4836-8b2e-8390c588cf80"
    subscription_id      = "0688c9ba-193b-49f3-a3a5-98735a3908df"
    resource_group_name  = "cloudfoundation-tfstates"
    storage_account_name = "tfstatesbuildingblocks"
    container_name       = "tfstates"
    key                  = "building-block-cosmosDB"
  }
}
