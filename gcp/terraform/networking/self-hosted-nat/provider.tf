terraform {
  backend "gcs" {
    bucket      = "terraform-state-nat-bb"
    prefix      = "nat"
    credentials = "./credentials.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 0.13"
}

provider "google" {
  project     = var.project
  zone        = var.zone
  credentials = "./credentials.json"
}
