# Output variable definitions

output "resource_group_id" {
  description = "resource group id"
  value       = azurerm_resource_group.rg.id
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "resource group location"
  value       = azurerm_resource_group.rg.location
}


output "azuread_application_app_object_id" {
  description = "Application object object id"
  value       = azuread_application.app.object_id
}

output "azuread_application_app_application_id" {
  description = "Application object application id"
  value       = azuread_application.app.application_id
}

output "azuread_application_app_id" {
  description = "Application object  id"
  value       = azuread_application.app.id
}

output "azuread_application_app_display_name" {
  description = "Application object display name"
  value       = azuread_application.app.display_name
}

