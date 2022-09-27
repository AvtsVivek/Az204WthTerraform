data "azuread_application_published_app_ids" "well_known" {}

data "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
}

resource "azurerm_resource_group" "rg" {
  # name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  name = "here-we-go"
  # location = var.resource_group_location
  location = "eastus"
  # tags     = local.common_tags
}

resource "azurerm_storage_account" "storage_account_for_azure_func" {
  name                     = "vivwinfuncappsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_windows_function_app" "test" {
  name = "example-asdfasdf-windows-function-app"
  # name                = "${local.resource_name_prefix}-${var.win_function_app_name}-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.storage_account_for_azure_func.name
  storage_account_access_key = azurerm_storage_account.storage_account_for_azure_func.primary_access_key
  service_plan_id            = azurerm_service_plan.service_plan_for_azure_func.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      dotnet_version = 6.0
    }
  }
}


resource "azuread_app_role_assignment" "test" {
  app_role_id         = data.azuread_service_principal.msgraph.app_role_ids["Group.Read.All"]
  principal_object_id = azurerm_windows_function_app.test.identity[0].principal_id
  resource_object_id  = data.azuread_service_principal.msgraph.object_id
}

variable "service_plan_name" {
  description = "service plan name"
  type        = string
  default     = "win-service-plan"
}

variable "windows_sku_name" {
  description = "windows web app SKU name "
  type        = string
  # default     = "P1v2"
  default = "S1"
}

variable "windows_os_type" {
  description = "windows web app OS Type "
  type        = string
  default     = "Windows"
}

resource "azurerm_service_plan" "service_plan_for_azure_func" {
  # name                = "${local.resource_name_prefix}-${var.service_plan_name}"
  name                = "service-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = var.windows_os_type
  sku_name            = var.windows_sku_name
}