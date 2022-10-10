
resource "azuread_service_principal" "app_sp" {
  # The following is not working(object_id).
  # application_id               = azuread_application.example.object_id

  # The following is working(application_id).
  application_id = azuread_application.app.application_id

  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  # What is the significance of the following feature_tags block? If we dont have this, then 
  # You will NOT see enterprise application in AAD -> Enterprise Applications -> All Application
  # The application is there, but it will not be visible, its filtered out.
  # In such a case(when the following is commented out), if you want to see the enterprise application, then 
  # You have to remove all of the filters and type the name in search box, and then only will you be able to see it.
  # See the images in the images folder.

  feature_tags {
    enterprise = true
    hide       = true
  }

}
