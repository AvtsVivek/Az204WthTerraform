# Resource-2: Azure Service Plan

resource "azurerm_service_plan" "service_plan" {
  name                = "tf-service-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

# Resource-3: Azure Windows Web App

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = "tf-service-web-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}
}
