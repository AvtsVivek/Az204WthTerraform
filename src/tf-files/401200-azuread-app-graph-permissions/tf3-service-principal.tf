# resource "azuread_service_principal" "app_sp" {
#   application_id = azuread_application.webapp.application_id

#   app_role_assignment_required = false
#   owners                       = [data.azuread_client_config.current.object_id]
# }

resource "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing   = true
}

resource "azuread_service_principal" "sp_app" {
  application_id = azuread_application.app.application_id

  # What is the significance of the following feature_tags block? If we dont have this, then 
  # You will NOT see enterprise application in AAD -> Enterprise Applications -> All Application
  # The application is there, but it will not be visible, its filtered out.

  feature_tags {
    enterprise = true
    hide       = true
  }
}