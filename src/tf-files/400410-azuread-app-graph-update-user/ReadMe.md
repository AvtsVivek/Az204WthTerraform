# Updates user

- This follows from the [last example](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/400400-azuread-app-graph-permissions). 

- There, the user list is retrieved using the graph API. In this example, we will be going a bit ahead and updating the an existing user.

- The following are the changes that made to the config files.
 
- tf8-role-assignment.tf

```tf
resource "azuread_app_role_assignment" "app_role_read_write_all" {
  app_role_id         = azuread_service_principal.msgraph.app_role_ids["User.ReadWrite.All"]
  principal_object_id = azuread_service_principal.sp_app.object_id
  resource_object_id  = azuread_service_principal.msgraph.object_id
}
```

- tf4-active-directory-user.tf
```tf
resource "azuread_user" "ad_user2" {
  user_principal_name = "aduser2@vivek7dm1outlook.onmicrosoft.com"
  display_name        = "aduser2"
  mail_nickname       = "aduser2"
  password            = "vivek@123" # Passwords should not be handled like this. Use secrets.tfvars file.
}

resource "azuread_user" "ad_user3" {
  user_principal_name = "aduser3@vivek7dm1outlook.onmicrosoft.com"
  display_name        = "aduser4"
  mail_nickname       = "aduser5"
  password            = "vivek@123" # Passwords should not be handled like this. Use secrets.tfvars file.
}
```

- tf4-active-directory-app.tf
```tf
resource_access {
  id   = azuread_service_principal.msgraph.app_role_ids["User.ReadWrite.All"]
  type = "Role" # Scope->Delegated permission and Role -> Application permission
}
```

- Get the token as explained in the previous example.

- Issue a get request to get the list of users. Use the GetUser.http.

- Now to update a user, issue a PATCH request. Use PatchUser.http

```
PATCH https://graph.microsoft.com/v1.0/users/2f0543ba-2841-49fc-b79d-1d1c0e6215c0 HTTP/1.1
Authorization: Bearer Paste_the_full_long_token_that_your_revieved_in_the_previous_post_request_step
Content-Type: application/json

{
    "givenName": "Ad User 2"
}
```

- The respons to the PATCH request must look as follows.

```
HTTP/1.1 204 No Content
Cache-Control: no-cache
Strict-Transport-Security: max-age=31536000
request-id: 4d30b66a-5cb5-46c1-94df-a4a4f83d445e
client-request-id: 4d30b66a-5cb5-46c1-94df-a4a4f83d445e
x-ms-ags-diagnostic: {"ServerInfo":{"DataCenter":"East US","Slice":"E","Ring":"5","ScaleUnit":"000","RoleInstance":"BL4PEPF000001B0"}}
x-ms-resource-unit: 1
Date: Fri, 30 Sep 2022 08:44:58 GMT
Connection: close

```

- Issue a get request again now to verify. Use the GetUser.http.

- 