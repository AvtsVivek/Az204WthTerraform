
resource "azurerm_role_assignment" "vm_to_st_acc_reader" {
  scope = azurerm_storage_account.storage_account.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles  
  role_definition_name = "Reader"
  principal_id         = azurerm_linux_virtual_machine.web_linuxvm.identity[0].principal_id
}

resource "azurerm_role_assignment" "vm_to_st_acc_data_reader" {
  scope = azurerm_storage_account.storage_account.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles  
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_linux_virtual_machine.web_linuxvm.identity[0].principal_id
}
