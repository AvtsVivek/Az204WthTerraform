
resource "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing   = true
}

data "azuread_client_config" "current" {}

data "azuread_application_published_app_ids" "well_known" {}

resource "azuread_application" "app" {
  display_name = var.appname
  owners       = [data.azuread_client_config.current.object_id]

  # The following is not needed. 
  # For more information about the following, take a look at the following example. 
  # 400310-azuread-app-reg-permissions
  # When we create an app registration manually using portal, API permissions are added as shown in the image(20ApiPermissions10.jpg)
  # So if you want the same, then we need the following code. Otherwise, this block is not needed.

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"]
      type = "Scope" # Scope->Delegated and Role -> Application
    }
  }
}

resource "azuread_service_principal" "app_sp" {
  application_id = azuread_application.app.application_id
  owners         = [data.azuread_client_config.current.object_id]

  feature_tags {
    enterprise = true
    hide       = true
  }

}

