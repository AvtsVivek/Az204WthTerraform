# Azure Key Vault

- References
  - [Azure Key Vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault)
  - [Azure Key Vault secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)

- Deploys Azure Key Vault, adds a secret and key to it. Then using the dotnet app(/dotnet-apps/0270-AzureKeyVaultAccess/AzureKeyVaultAccess.csproj) we try to access the key.

- When you run the dotnet application, you may get an exception like this. 

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

- Review
![Review](./images/10AfterDeploymentReview1.jpg)
![Review](./images/10AfterDeploymentReview3.jpg)

- Review Active Directory
![Review Active Directory](./images/10AfterDeploymentReview10.jpg)
![Review Active Directory](./images/10AfterDeploymentReview12.jpg)

- Get the required info to update the program.cs file
- Need to update the following variable in the file 
./../../dotnet-apps/0270-AzureKeyVaultAccess/Program.cs

```
var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
var clientId = "ab0adc88-52b7-4c2b-b47d-66814eb84af0";
var clientSecret = "0iO8Q~fsNhL97YRXpYcqLwIekgJziyOyfPRGPcA0";
# var keyvaultUrl = "https://vivek-jgybpk-my-rg.vault.azure.net/";
```

