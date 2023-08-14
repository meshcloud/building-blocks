data "azuread_client_config" "current" {}

resource "azuread_application" "building_blocks_spn" {
  display_name = var.spn_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "building_blocks_spn" {
  application_id               = azuread_application.building_blocks_spn.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  feature_tags {
    enterprise = true
  }
}

resource "azuread_service_principal_password" "service_principal_pw" {
  service_principal_id = azuread_service_principal.building_blocks_spn.id
  end_date             = var.spn_password_expiration
}
