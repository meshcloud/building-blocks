#
# storage for terraform state of service instances
#
locals {
  scope = var.subscription_id
}
resource "azurerm_resource_group" "vnet_building_block" {
  name     = "vnetbuildingblock"
  location = var.location
}
resource "azurerm_storage_account" "vnet_building_block" {
  name                     = "vnetbuildingblock"
  resource_group_name      = azurerm_resource_group.vnet_building_block.name
  location                 = azurerm_resource_group.vnet_building_block.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "vnet_building_block" {
  name                 = "tfstates"
  storage_account_name = azurerm_storage_account.vnet_building_block.name
}

#
# Service Principal for managing service instances
#
resource "azuread_application" "vnet_building_block" {
  display_name = "unipipe-networking"
}

resource "azuread_service_principal" "vnet_building_block" {
  application_id = azuread_application.vnet_building_block.application_id
}

resource "azuread_service_principal_password" "vnet_building_block" {
  service_principal_id = azuread_service_principal.vnet_building_block.object_id
}

#
# Permissions for the Service Principal to manage service instances
#
resource "azurerm_role_definition" "resource_group_contributor" {
  name        = "resource_group_contributor"
  scope       = local.scope
  description = "A custom role that allows to manage resource groups. Used by Cloud Foundation automation."

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/write",
      "Microsoft.Resources/subscriptions/resourceGroups/delete",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
    ]
  }

  assignable_scopes = [
    local.scope
  ]
}

resource "azurerm_role_assignment" "resource_group_contributor" {
  scope              = local.scope
  role_definition_id = azurerm_role_definition.resource_group_contributor.role_definition_resource_id
  principal_id       = azuread_service_principal.vnet_building_block.id
}

resource "azurerm_role_assignment" "networking_contributor" {
  scope                = local.scope
  role_definition_name = "Network Contributor"
  principal_id         = azuread_service_principal.vnet_building_block.object_id
}

resource "azurerm_role_assignment" "vnet_building_block_backend" {
  scope                = azurerm_storage_account.vnet_building_block.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.vnet_building_block.id
}
