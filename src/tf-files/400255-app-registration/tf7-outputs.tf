
output "app_name" {
  description = "Display name of the App Registration"
  value       = azuread_application.webdb.display_name
}

