terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      version = ">= 3.0, < 4.0"
    }
  }
}


#Configure the Azure Provider
provider "azurerm" {
  features {
  }
}

