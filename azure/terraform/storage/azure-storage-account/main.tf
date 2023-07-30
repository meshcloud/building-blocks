resource "random_string" "unique" {
  length  = 6
  special = false
  upper   = false
  numeric = true
}

# Resource-1 Resource Group
resource "azurerm_resource_group" "rg_storage_account" {
  name     = var.resource_group_name
  location = var.location
}

# Resource-2 Storage account
resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg_storage_account.name
  location                  = azurerm_resource_group.rg_storage_account.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_https_traffic_only = true
  min_tls_version           = var.min_tls_version

  blob_properties {
    delete_retention_policy {
      days = var.soft_delete_retention
    }
    dynamic "cors_rule" {
      for_each = var.cors_rule
      content {
        allowed_origins    = cors_rule.value.allowed_origins
        allowed_methods    = cors_rule.value.allowed_methods
        allowed_headers    = cors_rule.value.allowed_headers
        exposed_headers    = cors_rule.value.exposed_headers
        max_age_in_seconds = cors_rule.value.max_age_in_seconds
      }
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = "Deny"
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
      bypass                     = var.network_rules.bypass
    }
  }

  tags = var.tags
}

# Resource-3 Storage account's container
resource "azurerm_storage_container" "container" {
  count                 = length(var.containers)
  name                  = var.containers[count.index].name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.containers[count.index].access_type
}

# Resource-4 Enable Advanced threat protection
resource "azurerm_advanced_threat_protection" "threat_protection" {
  count              = var.enable_advanced_threat_protection ? 1 : 0
  target_resource_id = azurerm_storage_account.storage.id
  enabled            = var.enable_advanced_threat_protection
}
