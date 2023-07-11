terraform {
  backend "azurerm" {
    # *** The following values should be pass to the terraform via Environment_Variables ***
    # *** To do so, Add these keys as "Input Variables" and choose "Environment" in "Provide as" field 

    # information of the storage account and the blob holding the terraform state file
    tenant_id            = "tenant-id-state"
    subscription_id      = "subscription-id-state"
    resource_group_name  = "cloudfoundation-tfstates"
    storage_account_name = "tfstatesbuildingblocks"
    container_name       = "tfstates"
    key                  = "building-block-cosmosDB"
  }
}
