provider "azurerm" {
  alias           = "spoke-provider"
  subscription_id = var.subscription_id
  # tenant_id, client_id and client_secret must be set via env variables
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

provider "azurerm" {
  alias           = "hub-provider"
  subscription_id = var.hub_subscription_id
  # tenant_id, client_id and client_secret must be set via env variables
  features {}
}
