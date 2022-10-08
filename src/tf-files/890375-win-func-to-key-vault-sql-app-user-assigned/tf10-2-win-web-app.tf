# Resource-2: Azure Service Plan

resource "azurerm_service_plan" "service_plan" {
  name                = "${local.resource_name_prefix}-${var.service_plan_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.windows_sku_name
  os_type             = var.windows_os_type
  # depends_on          = [azurerm_mssql_database.mssql_database]
}

# Resource-3: Azure Windows Web App

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = "${local.resource_name_prefix}-${var.windows_web_app_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}

  identity {
    type = "UserAssigned"
    # If you use UserAssigned, then identity_ids should not be null
    identity_ids = [azurerm_user_assigned_identity.appag_umid.id]
    # type = "SystemAssigned"
  }

  # In order to use a user assigned identity with the DefaultAzureCredential you must
  # specify the client id of the user assigned identity.
  # You can do this either by passing it in code via
  # DefaultAzureCredentialOptions.ManagedIdentityClientId like so:
  # var tokenCredential = new DefaultAzureCredential(new DefaultAzureCredentialOptions { ManagedIdentityClientId = "bc783ad4-77a7-4d5d-9151-8e9aad5d9fec" });
  # Alternatively you can also specify the client id to be used via the AZURE_CLIENT_ID environment variable.
  # https://github.com/Azure/azure-sdk-for-net/issues/13564#issuecomment-660431926
  # https://github.com/Azure/azure-sdk-for-net/issues/11400#issuecomment-620179175
  # For our case, we will be setting env var AZURE_CLIENT_ID in the terraform config file.

  app_settings = {
    "AZURE_CLIENT_ID" = azurerm_user_assigned_identity.appag_umid.client_id
  }

}


