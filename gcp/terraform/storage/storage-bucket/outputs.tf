output "self_link" {
  value       = google_storage_bucket.buildingblock-bucket.self_link
  description = "The URI of the created resource."
}

output "url" {
  value       = google_storage_bucket.buildingblock-bucket.url
  description = "The base URL of the bucket, in the format gs://<bucket-name>."
}
