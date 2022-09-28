
data "azuread_client_config" "current" {}

resource "azuread_application" "app" {
  display_name = "example"
  owners       = [data.azuread_client_config.current.object_id]
}
