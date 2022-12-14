# Resource-2: Azure Service Plan

resource "azurerm_service_plan" "service_plan" {
  name                = "${local.resource_name_prefix}-${var.service_plan_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.windows_sku_name
  os_type             = var.windows_os_type
}

# Resource-3: Azure Windows Web App

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = "${local.resource_name_prefix}-${var.windows_web_app_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}
}


