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


# output "azuread_application_app_object_id" {
#   description = "Application object object id"
#   value       = azuread_application.app.object_id
# }

# output "azuread_application_app_application_id" {
#   description = "Application object application id"
#   value       = azuread_application.app.application_id
# }

# output "azuread_application_app_id" {
#   description = "Application object  id"
#   value       = azuread_application.app.id
# }

# output "azuread_application_app_display_name" {
#   description = "Application object display name"
#   value       = azuread_application.app.display_name
# }

# output "azuread_service_principal_app_sp_id" {
#   description = "App Service Principal id"
#   value       = azuread_service_principal.app_sp.id
# }

# output "azuread_service_principal_app_sp_object_id" {
#   description = "App Service Principal object id"
#   value       = azuread_service_principal.app_sp.object_id
# }

# output "azuread_service_principal_app_sp_display_name" {
#   description = "App Service Principal display name"
#   value       = azuread_service_principal.app_sp.display_name
# }

# output "azuread_service_principal_app_sp_type" {
#   description = "App Service Principal type"
#   value       = azuread_service_principal.app_sp.type
# }

# ##########################################################

# output "azuread_service_principal_msgraph_id" {
#   description = "Msgraph Service Principal id"
#   value       = azuread_service_principal.msgraph.id
# }

# output "azuread_service_principal_msgraph_object_id" {
#   description = "Msgraph Service Principal object id"
#   value       = azuread_service_principal.msgraph.object_id
# }

# output "azuread_service_principal_msgraph_display_name" {
#   description = "Msgraph Service Principal display name"
#   value       = azuread_service_principal.msgraph.display_name
# }

# output "azuread_service_principal_msgraph_type" {
#   description = "Msgraph Service Principal type"
#   value       = azuread_service_principal.msgraph.type
# }

# output "app_name_password_value" {
#   description = "App Password value"
#   value       = azuread_application_password.simple_app_pass.value
#   sensitive   = true
# }