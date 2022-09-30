
# data "azuread_client_config" "current" {}

data "azurerm_subscription" "current_sub" {}



resource "azurerm_role_assignment" "reader_role" {
  scope                = data.azurerm_subscription.current_sub.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  role_definition_name = "Owner"
  principal_id         = azuread_user.ad_user.object_id

  # The following also should work. Its the same id
  # principal_id         = azuread_user.ad_user.id
}


