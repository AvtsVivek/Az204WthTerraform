resource "azuread_service_principal" "app_sp" {
  application_id = azuread_application.webapp.application_id

  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  feature_tags {
    enterprise = true
    hide       = true
  }

}