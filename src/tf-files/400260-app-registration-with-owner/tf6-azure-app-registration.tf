data "azuread_client_config" "current" {}

resource "azuread_application" "webdb" {
  display_name = var.appname
  owners       = [data.azuread_client_config.current.object_id]
}