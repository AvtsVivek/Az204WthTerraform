
# container

resource "azurerm_cosmosdb_sql_container" "grocery_source_container_ttl_ten_sec" {
  name                = "cosmos-sql-db-grocery-container-ttl_ten_secs"
  resource_group_name = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_db.name
  partition_key_path  = "/grocerysource"

  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container#default_ttl

  default_ttl = 10
}

resource "azurerm_cosmosdb_sql_container" "grocery_source_container_ttl_on" {
  name                = "cosmos-sql-db-grocery-container-ttl-on"
  resource_group_name = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_db.name
  partition_key_path  = "/grocerysource"

  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container#default_ttl

  default_ttl = -1
}

resource "azurerm_cosmosdb_sql_container" "cosmos_container_without_ttl" {
  name                = "cosmos-sql-db-grocery-container-without-ttl"
  resource_group_name = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_db.name
  partition_key_path  = "/grocerysource"
}
