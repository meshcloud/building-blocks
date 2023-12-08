terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.8.0"
    }
  }
}

provider "google" {
  credentials = "./service-account.json"
   project = var.projectid
   billing_project = var.projectid
   user_project_override = true
}

