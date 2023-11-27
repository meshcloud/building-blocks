output "action_group_name" {
  value = azurerm_monitor_action_group.action_group.name
}

output "webhook_receiver" {
  value = azurerm_monitor_action_group.action_group.webhook_receiver
}

output "resource_group_id" {
  value = azurerm_resource_group.rg_action_group.id
}

output "resource_group_name" {
  value = azurerm_resource_group.rg_action_group.name
}

