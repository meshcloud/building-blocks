terraform {
  required_version = ">= 1.0"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

provider "azuredevops" {
  # Remember to specify the org service url and personal access token details below
  org_service_url = "XXXXXXXXXXXXXXXXXXX"
  # personal_access_token = "XXXXXXXXXXXXXXXXXXX"
}

