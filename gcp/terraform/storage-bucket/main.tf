# creating a private bucket in standard storage, in the EU region.
# Life cycle settings for storage bucket objects
# and enabling public access prevention
resource "google_storage_bucket" "buildingblock-bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

  public_access_prevention = "enforced"
}

