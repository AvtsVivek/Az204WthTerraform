# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name = "${local.resource_name_prefix}-${random_string.myrandom.id}-${var.resource_group_name}"
  location = var.resource_group_location
  tags     = local.common_tags
}
