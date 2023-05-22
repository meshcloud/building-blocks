terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      version = ">= 3.0, < 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}


#Configure the Azure Provider
provider "azurerm" {
  #skip_provider_registration = true
  subscription_id = var.subscription_id #To be defined by "Platform Tenant ID" input
  tenant_id       = "703c8d27-13e0-4836-8b2e-8390c588cf80"
  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = true
    }
  }
}
