
# Create Azure Storage account

resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = var.location
  account_tier             = var.storage_account_tier             # Standard Or Premium
  account_replication_type = var.storage_account_replication_type # valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
  account_kind             = var.storage_account_kind

  access_tier = "Cool"

}

resource "azurerm_storage_container" "asc" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "container" # Possible values are blob, container or private. Defaults to private.
}

resource "azurerm_storage_blob" "static_files_html" {

  for_each               = toset(var.static_files_list)
  name                   = each.value
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.asc.name
  type                   = "Block"
  content_type           = "text/html"
  source                 = each.value

  access_tier = "Archive"

  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_storage_account.storage_account
  ]
}