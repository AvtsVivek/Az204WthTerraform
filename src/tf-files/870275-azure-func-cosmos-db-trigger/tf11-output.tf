output "function_app_name" {
  value       = azurerm_windows_function_app.win_function_app.name
  description = "Deployed function app name"
}

output "function_app_default_hostname" {
  value       = azurerm_windows_function_app.win_function_app.default_hostname
  description = "Deployed function app hostname"
}

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