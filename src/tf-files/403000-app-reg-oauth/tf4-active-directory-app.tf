
data "azuread_client_config" "current" {}

data "azuread_application_published_app_ids" "well_known" {}

resource "azuread_application" "app" {
  display_name = var.appname
  owners       = [data.azuread_client_config.current.object_id]
  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"]
      type = "Scope" # Scope->Delegated and Role -> Application
    }
  }

  web {

    # Notes about the following redirect uri. 
    # Where does 7192 come from.
    # Its from the web app launchSettings.json file.
    # Look for the following profile in launchSettings.json file.
    # ./../../dotnet-apps/0600-WebAppOAuthWithAAD/Properties/launchSettings.json
    # "WebAppOAuthWithAAD": {
    #   "commandName": "Project",
    #   "dotnetRunMessages": true,
    #   "launchBrowser": true,
    #   "applicationUrl": "https://localhost:7192;http://localhost:5192",
    #   "environmentVariables": {
    #     "ASPNETCORE_ENVIRONMENT": "Development"
    #   }
    # },

    # Where does signin-oidc come from?
    # It comes from appsettings.json file. 
    # ./../../dotnet-apps/0600-WebAppOAuthWithAAD/appsettings.json
    # Look for the following setting in that file

    #   "AadAppInfo": {
    #   "Instance": "https://login.microsoftonline.com/",
    #   "TenantId": "35b02984-c026-40c5-8cb3-2267c184d48a",
    #   "ClientId": "06531c0c-ec2b-42ca-9c54-ec2dea752e48",
    #   "CallbackPath": "/signin-oidc",
    #   "SignedOutCallbackPath": "/signout-oidc"
    # }

    redirect_uris = ["https://localhost:7192/signin-oidc"]

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }
}

