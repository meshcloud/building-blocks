output "vnet_id" {
  value = azurerm_virtual_network.spoke-vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.spoke-vnet.name
}

output "address_space" {
  value = azurerm_virtual_network.spoke-vnet.address_space
}
