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

- Get the client id and tenant id. In portal, go to AAD -> App Registrations -> Select the application object -> Overview.
  - Find ClientId and TenantId. 
  - Then fill them up in the appsettings.json file.
  - ./../../dotnet-apps/0600-WebAppOAuthWithAAD/appsettings.json

- Next Open tf4-active-directory-app.tf file. Look for the web block and read the notes around it.

- Then build and run. See the commands.sh file. Once you execute the dotnet run command, you will see that the 

- The web app now runs and you see a message Now listening on: https://localhost:7192

- Now open a browser Press Ctrl + Shift + N to create a new window in incongnito mode. Then browse to https://localhost:7192.

- Now login to Azure with creds and then give the required premissioins. Then you should be able to see the index page. Note that the index page Authorized, which means, Authentication and Authorization is needed to access that page. 
- See the images.




