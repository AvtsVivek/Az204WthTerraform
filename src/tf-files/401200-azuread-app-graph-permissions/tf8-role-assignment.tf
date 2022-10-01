
# data "azurerm_subscription" "current_sub" {}


# resource "azurerm_role_assignment" "reader_role" {
#   scope                = data.azurerm_subscription.current_sub.id
#   role_definition_name = "Owner"
#   principal_id         = azuread_service_principal.app_sp.object_id
# }


resource "azuread_app_role_assignment" "app_role" {
  app_role_id         = azuread_service_principal.msgraph.app_role_ids["User.Read.All"]
  principal_object_id = azuread_service_principal.sp_app.object_id
  resource_object_id  = azuread_service_principal.msgraph.object_id
}