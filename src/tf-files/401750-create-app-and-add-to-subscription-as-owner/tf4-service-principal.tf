resource "azuread_service_principal" "app_sp" {
  application_id = azuread_application.webapp.application_id

  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  # What is the significance of the following feature_tags block? If we dont have this, then 
  # You will NOT see enterprise application in AAD -> Enterprise Applications -> All Application
  # The application is there, but it will not be visible, its filtered out.
  # See the notes in the follwing file
  # https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/tf-files/401100-app-registration-service-principal/tf6-service-principal.tf
  feature_tags {
    enterprise = true
    hide       = true
  }

}