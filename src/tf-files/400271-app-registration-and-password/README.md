# This adds a secret.

- To actially see the password, you can use the following command after the apply command.

    terraform output app_name_password_value

- **app_name_password_value** comes from the output file as follows.

  ```
  output "app_name_password_value" {
  description = "App Password value"
  value       = azuread_application_password.simple_app.value
  sensitive   = true
}
  ```  
