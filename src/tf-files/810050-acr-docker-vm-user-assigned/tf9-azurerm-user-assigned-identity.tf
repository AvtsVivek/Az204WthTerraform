# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity
# Resource: User Assigned Managed Identity
resource "azurerm_user_assigned_identity" "appag_umid" {
  name                = "${local.resource_name_prefix}-appgw-umid"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

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

# az role assignment create --assignee $spID --scope $resourceID --role acrpull
# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "vm_to_acr" {
  scope = azurerm_container_registry.acr.id
  # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles  
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.appag_umid.principal_id
  # principal_id         = azurerm_kubernetes_cluster.kubweb.kubelet_identity[0].object_id
}