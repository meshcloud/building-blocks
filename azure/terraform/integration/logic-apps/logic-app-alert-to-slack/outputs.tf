output "resource_group_id" {
  value = azurerm_resource_group.workflow_rg.id
}

output "deployment" {
  value = azurerm_resource_group_template_deployment.rg_worklow_deployment.output_content
}
