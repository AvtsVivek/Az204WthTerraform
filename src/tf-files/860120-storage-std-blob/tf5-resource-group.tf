# Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = "${random_string.myrandom.id}-${var.resource_group_name}"
  location = var.location
}