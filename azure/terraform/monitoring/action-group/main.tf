locals {
  location                = var.location
  action_group_name       = var.action_group_name
  action_group_short_name = var.action_group_short_name
}

//-----------------------------------------------
// Action Group
//-----------------------------------------------
resource "azurerm_resource_group" "rg_action_group" {
  name     = var.resource_group_name
  location = local.location
}
resource "azurerm_monitor_action_group" "action_group" {
  name                = local.action_group_name
  resource_group_name = azurerm_resource_group.rg_action_group.name
  short_name          = local.action_group_short_name


  webhook_receiver {
    name                    = var.webhook_name
    service_uri             = var.webhook_url
    use_common_alert_schema = true
  }
}
