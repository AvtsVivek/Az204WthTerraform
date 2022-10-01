
output "app_name" {
  description = "Display name of the App Registration"
  value       = azuread_application.simple_app.display_name
}

output "app_name_password_object_id" {
  description = "App Password object id"
  value       = azuread_application_password.simple_app.application_object_id
}

output "app_name_password_display_name" {
  description = "App Password display name"
  value       = azuread_application_password.simple_app.display_name
}

output "app_name_password_value" {
  description = "App Password value"
  value       = azuread_application_password.simple_app.value
  sensitive   = true
}


