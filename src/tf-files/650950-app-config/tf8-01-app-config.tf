
# The following data and azurerm_role_assignment are needed. Without that, we get the following error as descirved in the following issue.
# https://github.com/hashicorp/terraform-provider-azurerm/issues/15721

data "azurerm_client_config" "test" {}

resource "azurerm_role_assignment" "test" {
  scope                = azurerm_resource_group.rg.id
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

resource "azurerm_app_configuration_key" "config_key_backgound_color" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = "TestApp:Settings:BackgroundColor"
  # Note: There should be no lable. If you keep any label, the app will not be able to read them.
  # label                  = "somelabel"
  value = "#FFF"
}

resource "azurerm_app_configuration_key" "config_key_font_color" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = "TestApp:Settings:FontColor"
  # Note: There should be no lable. If you keep any label, the app will not be able to read them.
  # label                  = "somelabel"
  value = "#000"
}

resource "azurerm_app_configuration_key" "config_key_font_size" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = "TestApp:Settings:FontSize"
  # label                  = "somelabel"
  # Note: There should be no lable. If you keep any label, the app will not be able to read them.
  value = "24"
}

resource "azurerm_app_configuration_key" "config_key_message" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = "TestApp:Settings:Message"
  # label                  = "somelabel"
  value = "Data from Azure App Configuration"
}