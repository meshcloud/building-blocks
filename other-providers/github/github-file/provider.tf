terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">=6.2.3"
    }
    meshstack = {
      source  = "meshcloud/meshstack"
      version = ">=0.5.1"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

provider "meshstack" {
  endpoint  = var.meshstack_api_url
  apikey    = var.meshstack_api_key
  apisecret = var.meshstack_api_secret
}
