terraform {
  backend "azurerm" {
    tenant_id            = "703c8d27-13e0-4836-8b2e-8390c588cf80"
    subscription_id      = "9809209b-869e-4f5c-8d86-c8b71294153f"
    resource_group_name  = "cloudfoundation-tfstates"
    storage_account_name = "tfstatesbuildingblocks"
    container_name       = "tfstates"
    key                  = "building-block-law"
  }
}
