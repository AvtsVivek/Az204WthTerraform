resource "azuread_application" "internal" {
  display_name = "internal"

  app_role {
    allowed_member_types = ["Application"]
    description          = "Apps can query the database"
    display_name         = "Query"
    enabled              = true
    id                   = "00000000-0000-0000-0000-111111111111"
    value                = "Query.All"
  }
}

resource "azuread_service_principal" "internal" {
  application_id = azuread_application.internal.application_id
}

resource "azuread_application" "example" {
  display_name = "example"

  required_resource_access {
    resource_app_id = azuread_application.internal.application_id

    resource_access {
      id   = azuread_service_principal.internal.app_role_ids["Query.All"]
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id

  # What is the significance of the following feature_tags block? If we dont have this, then 
  # You will NOT see enterprise application in AAD -> Enterprise Applications -> All Application
  # The application is there, but it will not be visible, its filtered out.  
  # See the notes in the follwing file
  # https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/tf-files/401100-app-registration-service-principal/tf6-service-principal.tf
  feature_tags {
    enterprise = true
    hide       = true
  }  
}

resource "azuread_app_role_assignment" "example" {
  app_role_id         = azuread_service_principal.internal.app_role_ids["Query.All"]
  principal_object_id = azuread_service_principal.example.object_id
  resource_object_id  = azuread_service_principal.internal.object_id
}