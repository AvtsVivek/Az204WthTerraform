
# container

resource "azurerm_cosmosdb_sql_container" "grocery_source_container" {
  name                = "vivek-cosmos-sql-db-grocery-source-container"
  resource_group_name = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_db.name
  partition_key_path  = "/grocerysource"
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container#indexing_policy
  indexing_policy {
    composite_index {
      index {
        path  = "/category"
        order = "ascending"
      }
      index {
        path  = "/itemName"
        order = "ascending"
      }
    }
  }
}