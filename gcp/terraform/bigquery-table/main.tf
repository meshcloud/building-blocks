module "bigquery" {
  source            = "terraform-google-modules/bigquery/google" # Path to the module
  version           = "~> 2.0.0"                                 # Specify the version of the module you require
  dataset_id        = "test"
  dataset_name      = "test"
  description       = "some description" # updated the description accordingly
  expiration        = var.expiration
  project_id        = var.project_id
  location          = "europe-west3" # Update location if needed
  tables            = var.tables
  time_partitioning = var.time_partitioning
  dataset_labels    = var.dataset_labels
}
