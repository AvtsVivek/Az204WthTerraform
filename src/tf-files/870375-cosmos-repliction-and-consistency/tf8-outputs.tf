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

