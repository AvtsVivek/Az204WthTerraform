
# resource "azurerm_storage_account" "storage_account" {
#   name                     = "${var.storage_account_name}${random_string.myrandom.id}"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_mssql_server" "mssql_server" {
  name                         = "${local.resource_name_prefix}-${var.mssql_server_name}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "adm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "time_sleep" "wait_for_some_time" {
  depends_on      = [azurerm_mssql_server.mssql_server]
  create_duration = "60s"
}

# This resource will create (at least) 30 seconds after azurerm_mssql_server

resource "azurerm_mssql_database" "mssql_database" {
  name           = "${local.resource_name_prefix}-${var.mssql_database_name}"
  server_id      = azurerm_mssql_server.mssql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  depends_on     = [time_sleep.wait_for_some_time]
  tags           = local.common_tags
}


# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule#argument-reference
resource "azurerm_mssql_firewall_rule" "sql_server_firewall_rules_for_azure_access" {
  name             = "AzureAccessFirewallRule"
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}