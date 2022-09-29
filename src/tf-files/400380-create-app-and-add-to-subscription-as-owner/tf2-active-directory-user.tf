# resource "azuread_user" "ad_user" {
#   user_principal_name = "aduser2@vivek7dm1outlook.onmicrosoft.com"
#   display_name        = "aduser2"
#   mail_nickname       = "aduser2"
#   password            = "vivek@123" # Passwords should not be handled like this. User secrets.tfvars file.
# }


data "azuread_client_config" "current" {}

resource "azuread_application" "example" {
  display_name = "example"
  owners       = [data.azuread_client_config.current.object_id]
}


resource "azuread_service_principal" "example" {
  # The following is not working(object_id).
  # application_id               = azuread_application.example.object_id

  # The following is working(application_id).
  application_id = azuread_application.example.application_id

  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}
