# # Output variable definitions
# output "resource_group_id" {
#   description = "resource group id"
#   value       = azurerm_resource_group.resource_group.id
# }
# output "resource_group_name" {
#   description = "The name of the resource group"
#   value       = azurerm_resource_group.resource_group.name
# }
# output "resource_group_location" {
#   description = "resource group location"
#   value       = azurerm_resource_group.resource_group.location
# }
# output "storage_account_id" {
#   description = "storage account id"
#   value       = azurerm_storage_account.storage_account.id
# }
# output "storage_account_name" {
#   description = "storage account name"
#   value       = azurerm_storage_account.storage_account.name
# }


# output "aduser_name" {
#   description = "Created Active Directory User Name"
#   value       = azuread_user.ad_user.name
# }

output "aduser_creation_type" {
  description = "Created Active Directory User Creation Type"
  value       = azuread_user.ad_user.creation_type
}

output "aduser_creation_object_id" {
  description = "Created Active Directory User Creation Object Id"
  value       = azuread_user.ad_user.object_id
}

output "aduser_creation_user_type" {
  description = "Created Active Directory User Creation User Type"
  value       = azuread_user.ad_user.user_type
}

output "aduser_creation_user_display_name" {
  description = "Created Active Directory User Creation Display Name"
  value       = azuread_user.ad_user.display_name
}

output "aduser_creation_user_user_principal_name" {
  description = "Created Active Directory User Creation Display Name"
  value       = azuread_user.ad_user.user_principal_name
}
