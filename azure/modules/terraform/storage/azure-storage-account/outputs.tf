output "location" {
  description = "The Azure region"
  value       = azurerm_resource_group.rg_storage_account.location
}

output "storage_account_id" {
  description = "Id of the storage account created."
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "Name of the storage account created."
  value       = azurerm_storage_account.storage.name
}
