# 
output "client_object_id" {
  description = "Client Object Id"
  value       = data.azuread_client_config.current.object_id
}

output "client_id" {
  description = "Client Id"
  value       = data.azuread_client_config.current.client_id
}

output "tenant_id" {
  description = "Client tenant Id"
  value       = data.azuread_client_config.current.tenant_id
}

# app_sp

output "service_principal_type_msgraph" {
  description = "Service Principal type for msgraph"
  value       = azuread_service_principal.msgraph.type
}

# The following gives a very large output. So I am commenting it for now.

# output "service_principal_app_roles_msgraph" {
#   description = "Service Principal App Roles for msgraph"
#   value       = azuread_service_principal.msgraph.app_roles
# }

output "service_principal_display_name_msgraph" {
  description = "Service Principal display name for msgraph"
  value       = azuread_service_principal.msgraph.display_name
}

output "service_principal_object_id_msgraph" {
  description = "Service Principal display name for msgraph"
  value       = azuread_service_principal.msgraph.object_id
}

output "service_principal_id_msgraph" {
  description = "Service Principal display name for msgraph"
  value       = azuread_service_principal.msgraph.id
}

################################################################

output "service_principal_type" {
  description = "Service Principal type"
  value       = azuread_service_principal.sp_app.type
}

output "service_principal_app_roles" {
  description = "Service Principal App Roles"
  value       = azuread_service_principal.sp_app.app_roles
}

output "service_principal_display_name" {
  description = "Service Principal display name"
  value       = azuread_service_principal.sp_app.display_name
}

output "service_principal_object_id" {
  description = "Service Principal display name"
  value       = azuread_service_principal.sp_app.object_id
}

output "service_principal_id" {
  description = "Service Principal display name"
  value       = azuread_service_principal.sp_app.id
}

################################################################

output "published_app_ids_MsGraph" {
  value = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
}
