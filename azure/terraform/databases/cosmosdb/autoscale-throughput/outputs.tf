output "sql_container_name" {
  value = azurerm_cosmosdb_sql_container.example.name
}

output "cosmosdb_account_location" {
  value = azurerm_cosmosdb_account.example.location
}


output "max_throughput" {
  value = azurerm_cosmosdb_sql_container.example.autoscale_settings[0].max_throughput
}

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.example.name
}
