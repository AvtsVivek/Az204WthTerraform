
# Create Azure Storage account

resource "azurerm_cosmosdb_account" "cosmos_db" {
  name                = "${var.resource_group_name_prefix}-${random_string.myrandom.id}-cosmos-db"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  offer_type          = "Standard"
  # kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Session"
  }

  # capabilities {
  #   name = "EnableAggregationPipeline"
  # }

  # capabilities {
  #   name = "mongoEnableDocLevelTTL"
  # }

  # capabilities {
  #   name = "MongoDBv3.4"
  # }

  # capabilities {
  #   name = "EnableMongo"
  # }

  # consistency_policy {
  #   consistency_level       = "BoundedStaleness"
  #   max_interval_in_seconds = 300
  #   max_staleness_prefix    = 100000
  # }

  # geo_location {
  #   location          = "eastus"
  #   failover_priority = 1
  # }

  # geo_location {
  #   location          = "westus"
  #   failover_priority = 0
  # }

}