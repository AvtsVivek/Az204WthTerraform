# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity
# Resource: User Assigned Managed Identity
resource "azurerm_user_assigned_identity" "appag_umid" {
  name                = "${local.resource_name_prefix}-appgw-umid"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

