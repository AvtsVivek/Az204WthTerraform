
# Create Azure Storage account

resource "azurerm_cosmosdb_account" "cosmos_db_account" {
  name                = "${var.resource_group_name_prefix}-${random_string.myrandom.id}-cosmos-db-account"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB" # Default.

  enable_automatic_failover = false

  enable_free_tier = true

  consistency_policy {
    consistency_level = "Session"
  }

  backup {

    type = "Periodic" # Default is periodic

    storage_redundancy = "Geo"

    interval_in_minutes = 240

    retention_in_hours = 8

  }

  capacity {
    total_throughput_limit = -1
  }

  geo_location {

    location = var.location
    #  (Required) The failover priority of the region. 
    # A failover priority of 0 indicates a write region. 
    # The maximum value for a failover priority = (total number of regions - 1). 
    # Failover priority values must be unique for each of the regions in which the database account exists. 
    # Changing this causes the location to be re-provisioned and cannot be changed for the location with failover priority 0.
    failover_priority = 0

    # zone_redundant (Optional) Should zone redundancy be enabled for this region? Defaults to false.
    zone_redundant = false
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmos_db" {
  name                = "vivek-cosmos-sql-db"
  resource_group_name = azurerm_cosmosdb_account.cosmos_db_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
  throughput          = 400
}