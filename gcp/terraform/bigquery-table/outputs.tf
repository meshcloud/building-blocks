output "bigquery_dataset_id" {
  value       = google_bigquery_dataset.default.dataset_id
  description = "Bigquery dataset resource."
}

output "bigquery_tables_id" {
  value = google_bigquery_table.default.table_id
}
