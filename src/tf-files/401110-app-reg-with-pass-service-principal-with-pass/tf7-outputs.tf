
# output "app_name" {
#   description = "Display name of the App Registration"
#   value       = azuread_application.webdb.display_name
# }

output "object_id" {
  value = data.azuread_client_config.current.object_id
}

output "client_id" {
  value = data.azuread_client_config.current.client_id
}

output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}

# app_sp

output "service_principal_type" {
  description = "Service Principal type"
  value       = azuread_service_principal.app_sp.type
}

output "service_principal_app_roles" {
  description = "Service Principal App Roles"
  value       = azuread_service_principal.app_sp.app_roles
}

output "service_principal_display_name" {
  description = "Service Principal display name"
  value       = azuread_service_principal.app_sp.display_name
}

output "service_principal_object_id" {
  description = "Service Principal display name"
  value       = azuread_service_principal.app_sp.object_id
}

output "service_principal_id" {
  description = "Service Principal display name"
  value       = azuread_service_principal.app_sp.id
}

output "service_principal_password_value" {
  description = "Service Principal Password value"
  value       = azuread_service_principal_password.app_sp_pass.value
  sensitive   = true
}

output "app_name_password_value" {
  description = "App Password value"
  value       = azuread_application_password.simple_app_pass.value
  sensitive   = true
}