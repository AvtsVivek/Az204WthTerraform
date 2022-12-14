
# https://github.com/hashicorp/terraform-provider-azurerm/issues/15721

data "azurerm_client_config" "test" {}

resource "azurerm_role_assignment" "test" {
  scope                = azurerm_resource_group.rg.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles  
  role_definition_name = "App Configuration Data Owner"
  principal_id         = data.azurerm_client_config.test.object_id
}


resource "azurerm_app_configuration" "appconf" {
  name                = "${local.resource_name_prefix}-${var.resource_group_name}-app-conf-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  depends_on = [
    # azurerm_windows_web_app.windows_web_app,
    azurerm_role_assignment.test
  ]
}

resource "azurerm_app_configuration_key" "sql_connection" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = "SQLConnection"
  # label                  = "somelabel"
  value = "Server=tcp:hr-dev-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}