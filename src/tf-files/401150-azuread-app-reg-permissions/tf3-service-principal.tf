# resource "azuread_service_principal" "app_sp" {
#   application_id = azuread_application.webapp.application_id

#   app_role_assignment_required = false
#   owners                       = [data.azuread_client_config.current.object_id]
# }

resource "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing   = true
}

resource "azuread_service_principal" "app_sp" {
  application_id = azuread_application.app.application_id

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