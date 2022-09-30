
data "azurerm_subscription" "current_sub" {}


resource "azurerm_role_assignment" "reader_role" {
  # scope                = data.azurerm_subscription.current_sub.id

  scope                = azurerm_storage_account.storage_account.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.app_sp.object_id
}

resource "azurerm_role_assignment" "blob_data_reader_role" {
  # scope                = data.azurerm_subscription.current_sub.id
  scope                = azurerm_storage_account.storage_account.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  role_definition_name = "Storage Blob Data Reader"
  # Storage Blob Data Reader
  principal_id = azuread_service_principal.app_sp.object_id
}

