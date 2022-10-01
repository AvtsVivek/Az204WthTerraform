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