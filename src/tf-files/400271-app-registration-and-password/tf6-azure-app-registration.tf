
resource "azuread_application" "simple_app" {
  display_name = var.appname
}

resource "azuread_application_password" "simple_app" {
  application_object_id = azuread_application.simple_app.object_id
  display_name          = "AppPasswordGeneratedFromTerraform"
}