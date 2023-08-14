variable "location" {
  type        = string
  description = "Location of the bucket"
  default     = "EU"
}

variable "bucket_name" {
  type        = string
  description = "bucket name"
  default     = "buildingblockbucket"
}

variable "project_id" {
  type        = string
  description = "Google Project ID"
}
