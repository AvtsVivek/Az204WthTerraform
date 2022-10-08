
variable "win_function_app_name" {
  description = "Windows Function App name"
  type        = string
  default     = "win-func-app"
}

# win-func-sql-all-system-assigned

resource "azurerm_windows_function_app" "win_function_app" {
  name                = "${local.resource_name_prefix}-${random_string.myrandom.id}-${var.win_function_app_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.storage_account_for_azure_func.name
  storage_account_access_key = azurerm_storage_account.storage_account_for_azure_func.primary_access_key
  service_plan_id            = azurerm_service_plan.service_plan_for_azure_func.id

  # app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"       = "",
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.application_insights.instrumentation_key,
    # https://stackoverflow.com/a/73834722/1977871
    FUNCTIONS_EXTENSION_VERSION = "~4"
    # If I assign "~3", then the deployed function is not working. So currently keep it to "~4" and not "~3"
    "AZURE_CLIENT_ID" = azurerm_user_assigned_identity.appag_umid.client_id
  }

  site_config {
    application_stack {
      dotnet_version = 6.0
    }
  }

  identity {
    type = "UserAssigned"
    # If you use UserAssigned, then identity_ids should not be null
    identity_ids = [azurerm_user_assigned_identity.appag_umid.id]
    # type = "SystemAssigned"
  }
}