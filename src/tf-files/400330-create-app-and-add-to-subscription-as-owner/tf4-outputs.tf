# output "object_id" {
#   description = "Client Object Id"
#   value       = data.azuread_client_config.current.object_id
# }

# output "client_id" {
#   description = "Client Id"
#   value       = data.azuread_client_config.current.client_id
# }

# output "tenant_id" {
#   description = "Client tenant Id"
#   value       = data.azuread_client_config.current.tenant_id
# }

output "current_subscription_display_name" {
  description = "Current Subscription Name"
  value       = data.azurerm_subscription.current_sub.display_name
}

output "current_subscription_full_id" {
  description = "Current Subscription full Id"
  value       = data.azurerm_subscription.current_sub.id
}

output "current_subscription_guid" {
  description = "Current Subscription guid"
  value       = data.azurerm_subscription.current_sub.subscription_id
}

output "current_subscription_tenant_id" {
  description = "Current tenant id from Subscription object"
  value       = data.azurerm_subscription.current_sub.tenant_id
}

output "created_user_id" {
  description = "The id of the created user"
  value = azuread_user.ad_user.id
}

output "created_user_object_id" {
  description = "The object id of the created user"
  value = azuread_user.ad_user.object_id
}
 
