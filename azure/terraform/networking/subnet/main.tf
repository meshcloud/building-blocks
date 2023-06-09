terraform {
  required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.27.0"
    }
  }
}

data "azurerm_virtual_network" "vmaas" {
  name                = "vmaas"
  resource_group_name = "vmaas"
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.customer}-${var.project}-${var.name}-sn"
  resource_group_name  = "vmaas"
  virtual_network_name = data.azurerm_virtual_network.vmaas.name
  address_prefixes     = [var.address_space]
}
