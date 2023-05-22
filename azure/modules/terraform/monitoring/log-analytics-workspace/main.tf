resource "random_string" "unique" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

# Resource-1 Resource Group
resource "azurerm_resource_group" "rg_law" {
  name     = "${var.resource_group_name}${random_string.unique.id}"
  location = var.location
}

# Resource-2 Log analytics workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = "log${random_string.unique.id}"
  location            = azurerm_resource_group.rg_law.location
  resource_group_name = azurerm_resource_group.rg_law.name
  sku                 = "PerGB2018"
  retention_in_days   = 365
}
