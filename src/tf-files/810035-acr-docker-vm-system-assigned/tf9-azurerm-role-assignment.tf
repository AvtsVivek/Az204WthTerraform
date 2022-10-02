
resource "azurerm_role_assignment" "vm_to_acr" {
  scope = azurerm_container_registry.acr.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles  
  role_definition_name = "AcrPull"
  # principal_id         = azurerm_user_assigned_identity.appag_umid.principal_id
  principal_id = azurerm_linux_virtual_machine.web_linuxvm.identity[0].principal_id
  # principal_id         = azurerm_kubernetes_cluster.kubweb.kubelet_identity[0].object_id
}
