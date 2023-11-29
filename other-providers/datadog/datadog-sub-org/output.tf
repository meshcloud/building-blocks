output "api_key" {
  description = "API Key"
  value       = datadog_child_organization.organization.api_key
}

output "application_key" {
  description = "Application Key"
  value       = datadog_child_organization.organization.application_key
}

output "public_id" {
  description = "Datadog Public ID"
  value       = datadog_child_organization.organization.public_id
}