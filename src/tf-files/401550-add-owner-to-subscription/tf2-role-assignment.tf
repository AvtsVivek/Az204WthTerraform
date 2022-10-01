
data "azuread_client_config" "current" {}

data "azurerm_subscription" "current_sub" {}



resource "azurerm_role_assignment" "reader_role" {
  scope                = data.azurerm_subscription.current_sub.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  role_definition_name = "Owner"
  principal_id         = data.azuread_client_config.current.object_id
}


