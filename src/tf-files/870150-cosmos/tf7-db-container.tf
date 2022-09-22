
resource "azurerm_cosmosdb_sql_container" "category_container" {
  name                  = "vivek-cosmos-sql-db-category-container"
  resource_group_name   = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmos_db_account.name
  database_name         = azurerm_cosmosdb_sql_database.cosmos_db.name
  partition_key_path    = "/category"
  partition_key_version = 1
}

resource "azurerm_cosmosdb_sql_container" "grocery_source_container" {
  name                = "vivek-cosmos-sql-db-grocery-source-container"
  resource_group_name = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_db.name
  partition_key_path  = "/grocerysource"
}