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
