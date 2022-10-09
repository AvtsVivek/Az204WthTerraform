# This adds a secret.

- To actially see the password, you can use the following command after the apply command.

    terraform output terraform output service_principal_password_value

- **terraform output service_principal_password_value** comes from the output file as follows.

```
output "service_principal_password_value" {
  description = "Service Principal Password value"
  value       = azuread_service_principal_password.app_sp_pass.value
  sensitive   = true
}


```

- The user case for this is not clear. Need to check.

- Also I did not find a way to see the password on the portal

- The above is from previous example. The folowing is also added, in additioin to the abovce.

```
resource "azuread_application_password" "simple_app_pass" {
  application_object_id = azuread_application.simple_app.object_id
  display_name          = "AppPasswordGeneratedFromTerraform"

  # You cannot set a value as below. It will give an following error. Try uncommenting that out check yourself.
  # an't configure a value for "value": its value will be decided automatically based on the result of applying this configuration.
  # So commenting it out
  # value                 = "asdf49jk84jk"
}

```