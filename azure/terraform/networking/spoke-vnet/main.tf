locals {
  prefix-spoke = "${var.vnet_prefix}-spoke-${var.subscription_id}"
  next_hop_in_ip_address = "10.0.0.36" # Change it to private IP of your existing NVA
}

resource "azurerm_resource_group" "spoke-vnet-rg" {
  provider = azurerm.spoke-provider
  name     = "${local.prefix-spoke}-vnet-rg"
  location = var.location

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, as tags are managed by meshStack and policies
      tags
    ]
  }
}

resource "azurerm_virtual_network" "spoke-vnet" {
  provider            = azurerm.spoke-provider
  name                = "${local.prefix-spoke}-vnet"
  location            = azurerm_resource_group.spoke-vnet-rg.location
  resource_group_name = azurerm_resource_group.spoke-vnet-rg.name
  address_space       = [var.address_space_workload]

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, as tags are managed by meshStack and policies
      tags
    ]
  }
}

resource "azurerm_subnet" "spoke-vnet-subnet" {
  provider             = azurerm.spoke-provider
  name                 = "spoke-vnet-subnet"
  resource_group_name  = azurerm_resource_group.spoke-vnet-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-vnet.name
  address_prefixes     = [var.address_space_workload]
}

resource "azurerm_route_table" "spoke-rt" {
  provider                      = azurerm.spoke-provider
  name                          = "spoke-rt"
  location                      = azurerm_resource_group.spoke-vnet-rg.location
  resource_group_name           = azurerm_resource_group.spoke-vnet-rg.name
  disable_bgp_route_propagation = false

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, as tags are managed by meshStack and policies
      tags
    ]
  }
}

resource "azurerm_route" "spoke-default-route" {
  provider            = azurerm.spoke-provider
  resource_group_name = azurerm_resource_group.spoke-vnet-rg.name
  route_table_name    = azurerm_route_table.spoke-rt.name
  name                = "default"
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "VirtualNetworkGateway"
}

resource "azurerm_subnet_route_table_association" "spoke-rt-spoke-vnet-subnet" {
  provider       = azurerm.spoke-provider
  subnet_id      = azurerm_subnet.spoke-vnet-subnet.id
  route_table_id = azurerm_route_table.spoke-rt.id
  depends_on     = [azurerm_subnet.spoke-vnet-subnet]
}

#
# Peering with hub
#
data "azurerm_resource_group" "hub-vnet-rg" {
  provider = azurerm.hub-provider
  name     = var.hub-vnet-rg
}

data "azurerm_virtual_network" "hub-vnet" {
  provider            = azurerm.hub-provider
  name                = var.hub-vnet
  resource_group_name = data.azurerm_resource_group.hub-vnet-rg.name
}

resource "azurerm_virtual_network_peering" "spoke-hub-peer" {
  provider                  = azurerm.spoke-provider
  name                      = "spoke-hub-peer-${local.prefix-spoke}"
  resource_group_name       = azurerm_resource_group.spoke-vnet-rg.name
  virtual_network_name      = azurerm_virtual_network.spoke-vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.hub-vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
  depends_on                   = [azurerm_virtual_network.spoke-vnet]
}

resource "azurerm_virtual_network_peering" "hub-spoke-peer" {
  provider = azurerm.hub-provider

  name                         = "hub-spoke-peer-${local.prefix-spoke}"
  resource_group_name          = data.azurerm_resource_group.hub-vnet-rg.name
  virtual_network_name         = data.azurerm_virtual_network.hub-vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke-vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.spoke-vnet]
}

#
# Routing from hub to spoke
#


data "azurerm_route_table" "hub-gateway-rt" {
  provider            = azurerm.hub-provider
  name                = var.hub-route-table
  resource_group_name = data.azurerm_resource_group.hub-vnet-rg.name
}

resource "azurerm_route" "to-spoke" {
  provider               = azurerm.hub-provider
  name                   = "toSpoke-${local.prefix-spoke}"
  resource_group_name    = data.azurerm_resource_group.hub-vnet-rg.name
  route_table_name       = data.azurerm_route_table.hub-gateway-rt.name
  address_prefix         = var.address_space_workload
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = local.next_hop_in_ip_address
}
