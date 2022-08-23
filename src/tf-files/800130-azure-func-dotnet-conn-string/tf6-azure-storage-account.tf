resource "azurerm_storage_account" "storage_account_for_azure_func" {
  name                     = "vivwinfuncappsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# resource "azurerm_storage_account" "storage_account" {
#   name = "${var.project}${var.environment}storage"
#   resource_group_name = azurerm_resource_group.resource_group.name
#   location = var.location
#   account_tier = "Standard"
#   account_replication_type = "LRS"
# }