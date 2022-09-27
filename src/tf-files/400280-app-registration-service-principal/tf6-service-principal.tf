
resource "azuread_service_principal" "example" {
  # The following is not working(object_id).
  # application_id               = azuread_application.example.object_id

  # The following is working(application_id).
  application_id = azuread_application.example.application_id

  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}
