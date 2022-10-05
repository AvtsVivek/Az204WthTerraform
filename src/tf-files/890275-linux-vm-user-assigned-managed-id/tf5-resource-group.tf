# Resource-1: Azure Resource Group  random_string.myrandom.id 
resource "azurerm_resource_group" "rg" {
  # hr-dev-rg-vivrag-cthyzu 
  # hr-dev-cthyzu-rg-vivrag
  name = "${local.resource_name_prefix}-${random_string.myrandom.id}-${var.resource_group_name}"
  # name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags     = local.common_tags
}
