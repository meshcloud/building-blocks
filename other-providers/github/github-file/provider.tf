terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">=6.2.3"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}
