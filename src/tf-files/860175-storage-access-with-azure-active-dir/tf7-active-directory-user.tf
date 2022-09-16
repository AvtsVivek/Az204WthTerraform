resource "azuread_user" "ad_user" {
  user_principal_name = "aduser2@vivek7dm1outlook.onmicrosoft.com"
  display_name        = "aduser2"
  mail_nickname       = "aduser2"
  password            = "vivek@123" # Passwords should not be handled like this. User secrets.tfvars file.
}

resource "azurerm_role_assignment" "vm_to_acr" {
  scope                = azurerm_storage_account.storage_account.id
  role_definition_name = "Storage Account Contributor"
  # principal_id         = azurerm_user_assigned_identity.appag_umid.principal_id
  principal_id = azuread_user.ad_user.object_id
  # principal_id         = azurerm_kubernetes_cluster.kubweb.kubelet_identity[0].object_id
}