terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.34.0"
    }
  }
}


provider "github" {
# token = ""      # Set the GITHUB_TOKEN environment variable 

owner   = var.github_owner # This is the target GitHub organization or individual user account to manage
}