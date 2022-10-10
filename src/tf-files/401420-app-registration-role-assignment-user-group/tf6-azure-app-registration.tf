data "azuread_domains" "example" {
  only_initial = true
}

resource "azuread_application" "internal" {
  display_name = "internal"

  app_role {
    allowed_member_types = ["Application", "User"]
    description          = "Admins can perform all task actions"
    display_name         = "Admin"
    enabled              = true
    id                   = "00000000-0000-0000-0000-222222222222"
    value                = "Admin.All"
  }
}

resource "azuread_service_principal" "internal" {
  application_id = azuread_application.internal.application_id

  # What is the significance of the following feature_tags block? If we dont have this, then 
  # You will NOT see enterprise application in AAD -> Enterprise Applications -> All Application
  # The application is there, but it will not be visible, its filtered out.

  feature_tags {
    enterprise = true
    hide       = true
  }  
}

resource "azuread_group" "example" {
  display_name     = "example"
  security_enabled = true
}

resource "azuread_app_role_assignment" "example_group" {
  app_role_id         = azuread_service_principal.internal.app_role_ids["Admin.All"]
  principal_object_id = azuread_group.example.object_id
  resource_object_id  = azuread_service_principal.internal.object_id
}

resource "azuread_user" "example" {
  display_name        = "D. Duck"
  password            = "SecretP@sswd99!"
  user_principal_name = "d.duck@${data.azuread_domains.example.domains.0.domain_name}"
}

resource "azuread_app_role_assignment" "example_user" {
  app_role_id         = azuread_service_principal.internal.app_role_ids["Admin.All"]
  principal_object_id = azuread_user.example.object_id
  resource_object_id  = azuread_service_principal.internal.object_id
}