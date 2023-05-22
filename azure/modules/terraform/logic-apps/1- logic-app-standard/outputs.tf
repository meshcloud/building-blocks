output "azurerm_resource_group_name" {
  value = azurerm_resource_group.ala_resource_group.name
}

output "azurerm_service_plan_SKU" {
  value = azurerm_service_plan.platform_logicapp_plan.sku_name
}

output "azurerm_storage_account_name" {
  value = azurerm_storage_account.logicapp_std_storage.name
}

output "azurerm_log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.platform_logicapp_logs.name
}

output "azurerm_application_insights_name" {
  value = azurerm_application_insights.platform_logicapp_appinsights.name
}

output "azurerm_logic_app_standard_name" {
  value = azurerm_logic_app_standard.helloworld.name
}
