
resource "azuread_application" "webdb" {
  display_name = var.appname
}