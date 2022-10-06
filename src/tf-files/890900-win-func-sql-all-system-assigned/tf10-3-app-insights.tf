resource "azurerm_application_insights" "application_insights" {
  name                = "${local.resource_name_prefix}-application-insights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights#argument-reference
  application_type = "web" # web for ASP.NET
}