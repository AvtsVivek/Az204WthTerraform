
data "azuread_client_config" "current" {}

resource "azuread_application" "simple_app" {
  display_name = var.appname
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "simple_app_pass" {
  application_object_id = azuread_application.simple_app.object_id
  display_name          = "AppPasswordGeneratedFromTerraform"

  # You cannot set a value as below. It will give an following error. Try uncommenting that out check yourself.
  # an't configure a value for "value": its value will be decided automatically based on the result of applying this configuration.
  # So commenting it out
  # value                 = "asdf49jk84jk"
}
