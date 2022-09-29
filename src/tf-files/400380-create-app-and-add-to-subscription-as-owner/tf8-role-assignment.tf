
data "azurerm_subscription" "current_sub" {}


resource "azurerm_role_assignment" "reader_role" {
  scope                = data.azurerm_subscription.current_sub.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.app_sp.object_id
}


