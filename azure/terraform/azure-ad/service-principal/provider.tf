terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.39.0"
    }
  }
}

provider "azuread" {
  # Configuration options
}
