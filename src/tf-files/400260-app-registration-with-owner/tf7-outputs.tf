
output "app_name" {
  description = "Display name of the App Registration"
  value       = azuread_application.webdb.display_name
}

output "object_id" {
  description = "Client Object Id"
  value = data.azuread_client_config.current.object_id
}

output "client_id" {
    description = "Client Id"
    value = data.azuread_client_config.current.client_id
}

output "tenant_id" {
    description = "Client tenant Id"
  value = data.azuread_client_config.current.tenant_id
}