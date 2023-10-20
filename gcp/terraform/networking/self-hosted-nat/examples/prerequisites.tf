locals {
  # A list of GCP projects (project IDs) that the service account will have
  # compute.instanceAdmin and compute.networkAdmin roles
  projects = [
    "project1",
    "project2"
  ]
}

resource "google_storage_bucket" "nat_building_block" {
  name                        = "<your-bucket-name>"
  location                    = "<region>"
  uniform_bucket_level_access = true
}

resource "google_service_account" "nat_building_block" {
  account_id   = "<your-sa-name>"
  display_name = "Service account for NAT building block"
  description  = "This SA is used by NAT building block to gain proper access"
}

resource "google_service_account_key" "nat_building_block" {
  service_account_id = google_service_account.nat_building_block.name
}

# Access to TF state
resource "google_storage_bucket_iam_member" "admin" {
  bucket = google_storage_bucket.nat_building_block.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.nat_building_block.email}"
}

# Access to create VMs
resource "google_project_iam_member" "vm" {
  for_each = toset(local.projects)
  project  = each.key
  member   = "serviceAccount:${google_service_account.nat_building_block.email}"
  role     = "roles/compute.instanceAdmin"
}

# Access to create routes/ip addresses
resource "google_project_iam_member" "network" {
  for_each = toset(local.projects)
  project  = each.key
  member   = "serviceAccount:${google_service_account.nat_building_block.email}"
  role     = "roles/compute.networkAdmin"
}

output "credentials_json" {
  description = "Credential JSON to be uploaded as encrypted input to the BB"
  sensitive   = true
  value       = base64decode(google_service_account_key.nat_building_block.private_key)
}

output "config_tf" {
  description = "Generates a config.tf that can be dropped into meshStack's BuildingBlockDefinition as an encrypted file input to configure this building block."
  sensitive   = true
  value       = <<EOF
provider "google" {
  project     = var.project
  zone        = var.zone
  credentials = "<path to uploaded credentials.json, e.g. ./credentials.json>"
}

terraform {
  backend "gcs" {
    bucket      = "<your-bucket-name>"
    prefix      = "nat"
    credentials = "<path to uploaded credentials.json, e.g. ./credentials.json>"
  }
}
EOF
}
