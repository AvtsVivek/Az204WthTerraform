
# Output Values
output "user_assigned_identity_id" {
  value = azurerm_user_assigned_identity.appag_umid.id
}

output "user_assigned_identity_principal_id" {
  value = azurerm_user_assigned_identity.appag_umid.principal_id
}

output "user_assigned_identity_client_id" {
  value = azurerm_user_assigned_identity.appag_umid.client_id
}

output "user_assigned_identity_tenant_id" {
  value = azurerm_user_assigned_identity.appag_umid.tenant_id
}