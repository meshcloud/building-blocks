output "dataset_id" {
  value       = module.bigquery.dataset_id
  description = "Unique id for the dataset being provisioned"
}

output "dataset_name" {
  value       = module.bigquery.dataset_name
  description = "Friendly name for the dataset being provisioned"
}

output "dataset_project" {
  value       = module.bigquery.dataset_project
  description = "Project where the dataset and table are created"
}

output "table_id" {
  value       = module.bigquery.table_id
  description = "Unique id for the table being provisioned"
}

output "table_name" {
  value       = module.bigquery.table_name
  description = "Friendly name for the table being provisioned"
}

output "dataset_labels" {
  value       = module.bigquery.dataset_labels
  description = "Key value pairs in a map for dataset labels"
}

output "table_labels" {
  value       = module.bigquery.table_labels
  description = "Key value pairs in a map for table labels"
}
