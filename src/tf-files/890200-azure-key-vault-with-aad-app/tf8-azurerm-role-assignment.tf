
# Is this needed? Need to find out.

# resource "azurerm_role_assignment" "key_vault_role" {
#   scope = azurerm_key_vault.key_vault.id
#   # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
#   role_definition_name = "Key Vault Administrator"
#   principal_id = azuread_service_principal.app_sp.object_id
# }

