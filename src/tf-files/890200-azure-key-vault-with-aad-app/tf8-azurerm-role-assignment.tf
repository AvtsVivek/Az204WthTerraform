# resource "azurerm_role_assignment" "reader_role" {
#   # scope                = data.azurerm_subscription.current_sub.id

#   scope                = azurerm_key_vault.key_vault.id
#   # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
#   role_definition_name = "Reader"
#   principal_id         = azuread_service_principal.app_sp.object_id
# }


resource "azurerm_role_assignment" "key_vault_role" {
  scope = azurerm_key_vault.key_vault.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  role_definition_name = "Key Vault Administrator"
  # Storage Blob Data Reader
  principal_id = azuread_service_principal.app_sp.object_id
}

