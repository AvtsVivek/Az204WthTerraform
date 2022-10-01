

resource "azuread_app_role_assignment" "app_role_read_all" {
  app_role_id         = azuread_service_principal.msgraph.app_role_ids["User.Read.All"]
  principal_object_id = azuread_service_principal.sp_app.object_id
  resource_object_id  = azuread_service_principal.msgraph.object_id
}

resource "azuread_app_role_assignment" "app_role_read_write_all" {
  app_role_id         = azuread_service_principal.msgraph.app_role_ids["User.ReadWrite.All"]
  principal_object_id = azuread_service_principal.sp_app.object_id
  resource_object_id  = azuread_service_principal.msgraph.object_id
}