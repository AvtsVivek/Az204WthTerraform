resource "azurerm_application_insights" "application_insights" {
  name                = "${local.resource_name_prefix}-application-insights"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "Node.JS"
}