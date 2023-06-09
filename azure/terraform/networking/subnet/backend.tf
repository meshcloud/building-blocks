terraform {
  backend "azurerm" {
    tenant_id            = "703c8d27-13e0-4836-8b2e-8390c588cf80"
    subscription_id      = "0688c9ba-193b-49f3-a3a5-98735a3908df"
    resource_group_name  = "unipipe-networking"
    storage_account_name = "unipipenetworking"
    container_name       = "tfstates"
    key                  = "building-block-subnet"
  }
}
