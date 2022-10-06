
# Is this needed? Need to find out.

# resource "azurerm_role_assignment" "key_vault_role" {
#   scope = azurerm_key_vault.key_vault.id
#   # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
#   role_definition_name = "Key Vault Administrator"
#   principal_id = azuread_service_principal.app_sp.object_id
# }

# resource "azuread_application_password" "simple_app_pass" {
#   application_object_id = azuread_application.app.object_id
#   display_name          = "AppPasswordGeneratedFromTerraform"

#   # You cannot set a value as below. It will give an following error. Try uncommenting that out check yourself.
#   # can't configure a value for "value": its value will be decided automatically based on the result of applying this configuration.
#   # So commenting it out
#   # value                 = "asdf49jk84jk"
# }



