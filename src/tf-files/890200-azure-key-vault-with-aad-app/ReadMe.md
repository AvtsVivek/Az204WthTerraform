# Azure Key Vault

- [Azure Key Vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault)

- [Azure Key Vault secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)

- Deploys Azure Key Vault, adds a secret and key to it. Then using the dotnet app(/dotnet-apps/0270-AzureKeyVaultAccess/AzureKeyVaultAccess.csproj) we try to access the key.

- You may get an exception like this. 

> Unhandled exception. Azure.RequestFailedException: The policy requires the caller 'appid=d85236a6-410f-4ca6-a380-31205aaa6197;oid=3e287ec3-4afe-4538-a931-c4e3b648b32b;iss=https://sts.windows.net/46b02288-c094-50c5-3cb3-1168c454d83g/' to use on-behalf-of (OBO) flow. For more information on OBO, please see https://go.microsoft.com/fwlink/?linkid=2152310

- Then see [this so answer](https://stackoverflow.com/a/73918886/1977871).  

- Essentially the access policy should be configured like the following.

```
access_policy {
  tenant_id      = data.azurerm_client_config.current.tenant_id
  # application_id = azuread_application.app.application_id
  object_id      = azuread_service_principal.app_sp.object_id 
  ...
}
```
