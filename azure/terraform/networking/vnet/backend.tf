terraform {
  backend "azurerm" {
    resource_group_name  = "unipipe-networking"
    storage_account_name = "unipipenetworking"
    container_name       = "tfstates"
    key                  = "building-block-vnet"
  }
}
