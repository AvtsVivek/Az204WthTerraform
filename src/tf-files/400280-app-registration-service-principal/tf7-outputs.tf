
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



