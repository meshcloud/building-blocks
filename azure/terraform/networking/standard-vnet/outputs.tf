# Virtual Network Outputs
## Virtual Network Name
output "virtual_network_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}
## Virtual Network ID
output "virtual_network_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

# Subnet Outputs (We will write for one  subnet and rest all we will ignore for now)
## Subnet Name 
output "subnet_name" {
  description = "Subnet Name"
  value       = azurerm_subnet.subnet.name
}

## Subnet ID 
output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.subnet.id
}

# Network Security Outputs
##  Subnet NSG Name 
output "subnet_nsg_name" {
  description = "Subnet NSG Name"
  value       = azurerm_network_security_group.subnet_nsg.name
}

##  Subnet NSG ID 
output "subnet_nsg_id" {
  description = "Subnet NSG ID"
  value       = azurerm_network_security_group.subnet_nsg.id
}
