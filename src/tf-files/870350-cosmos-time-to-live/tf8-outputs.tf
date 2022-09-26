# Output variable definitions

output "resource_group_id" {
  description = "resource group id"
  value       = azurerm_resource_group.resource_group.id
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  description = "resource group location"
  value       = azurerm_resource_group.resource_group.location
}

output "cosmos_db_name" {
  description = "cosmos db name"
  value       = azurerm_cosmosdb_account.cosmos_db_account.name
}

output "cosmos_db_container_name_ttl_ten_sec" {
  description = "cosmos db container name ttl ten sec"
  value       = azurerm_cosmosdb_sql_container.grocery_source_container_ttl_ten_sec.name
}

output "cosmos_db_container_name_ttl_on" {
  description = "cosmos db container name ttl on"
  value       = azurerm_cosmosdb_sql_container.grocery_source_container_ttl_on.name
}

output "cosmos_db_container_name_without_ttl" {
  description = "cosmos db container name without ttl"
  value       = azurerm_cosmosdb_sql_container.cosmos_container_without_ttl.name
}
