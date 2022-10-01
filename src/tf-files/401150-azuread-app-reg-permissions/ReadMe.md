# Add permissions

- When we create an app registration manually using portal, API permissions are added as shown in the image(20ApiPermissions10.jpg)

- So the same is attempted when using Terraform config files. So we need to add the following 
**required_resource_access** block to the **azuread_application** resource.

```tf
required_resource_access {
  resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  resource_access {
    id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"]
    type = "Scope" # Scope->Delegated and Role -> Application
  }
}
```

- 


