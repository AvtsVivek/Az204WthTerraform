# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name_prefix}-${random_string.myrandom.id}-${var.resource_group_name_suffix}"
  # name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.location
  tags     = local.common_tags
}
