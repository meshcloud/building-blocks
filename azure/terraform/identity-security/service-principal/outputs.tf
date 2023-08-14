output "client_id" {
  value = azuread_application.building_blocks_spn.application_id
}

output "client_secret" {
  value     = azuread_service_principal_password.service_principal_pw.value
  sensitive = true
}

output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}
