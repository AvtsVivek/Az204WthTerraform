# Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name_prefix}-${random_string.myrandom.id}-${var.resource_group_name_suffix}"
  location = var.location
}
