terraform {
  required_providers {
    meshstack = {
      source  = "meshcloud/meshstack"
      version = ">=0.5.1"
    }
  }
}

provider "meshstack" {
  endpoint  = var.meshstack_api_url
  apikey    = var.meshstack_api_key
  apisecret = var.meshstack_api_secret
}
