
resource "azuread_service_principal" "app_sp" {
  # The following is not working(object_id).
  # application_id               = azuread_application.example.object_id

  # The following is working(application_id).
  application_id = azuread_application.simple_app.application_id

  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  # What is the significance of the following feature_tags block? If we dont have this, then 
  # You will NOT see enterprise application in AAD -> Enterprise Applications -> All Application
  # The application is there, but it will not be visible, its filtered out.

  feature_tags {
    enterprise = true
    hide       = true
  }

}

resource "azuread_service_principal_password" "app_sp_pass" {
  service_principal_id = azuread_service_principal.app_sp.object_id

  display_name = "App_ServicePrinciple_PasswordGeneratedFromTerraform"

  # You cannot set a value as below. It will give an following error. Try uncommenting that out check yourself.
  # an't configure a value for "value": its value will be decided automatically based on the result of applying this configuration.
  # So commenting it out
  # value                 = "asdf49jk84jk"
}