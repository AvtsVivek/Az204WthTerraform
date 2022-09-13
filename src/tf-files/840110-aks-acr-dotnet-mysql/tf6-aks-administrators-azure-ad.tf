# # Create Azure AD Group in Active Directory for AKS Admins
# resource "azuread_group" "aks_administrators" {
#   display_name = "${azurerm_resource_group.aks_rg.name}-cluster-admins"
#   description  = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks_rg.name}-cluster."
# }


# resource "azuread_user" "aks_user" {
#   user_principal_name = "aksadmin2@vivek7dm1outlook.onmicrosoft.com"
#   display_name        = "AKS Admin2"
#   mail_nickname       = "AksAdmin2"
#   password            = "@AKSDemo123"
# }

# resource "azuread_group_member" "example" {

#   # Is this object_id or just id

#   group_object_id  = azuread_group.aks_administrators.id
#   member_object_id = azuread_user.aks_user.id

#   # group_object_id  = azuread_group.aks_administrators.object_id
#   # member_object_id = azuread_user.aks_user.object_id

# }


