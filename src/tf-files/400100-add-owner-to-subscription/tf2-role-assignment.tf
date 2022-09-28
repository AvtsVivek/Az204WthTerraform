
data "azuread_client_config" "current" {}

data "azurerm_subscription" "current_sub" {}



resource "azurerm_role_assignment" "reader_role" {
  scope                = data.azurerm_subscription.current_sub.id
  role_definition_name = "Owner"
  # role_definition_name = "Storage Account Contributor"
  # principal_id         = azurerm_user_assigned_identity.appag_umid.principal_id
  principal_id = data.azuread_client_config.current.object_id
  # principal_id         = azurerm_kubernetes_cluster.kubweb.kubelet_identity[0].object_id
}


