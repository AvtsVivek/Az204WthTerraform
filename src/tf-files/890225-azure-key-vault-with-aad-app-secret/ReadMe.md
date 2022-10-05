# Azure Key Vault

- The objective is to demo an dotnet 6 app accessing a connection string(any secret for that matter) which is present as a secret inside of a Azure Key Vault.

- This example extends a previous example. This example, deploys an Azure Key Vault. And then inside of it a secret. That secret will contain a connection string. 

- This example also deploys a application object along with a service principal. Necessary Access Policy is also configured on the key vault which allows access to this applicatioin object. Find the following in the code.

```tf
access_policy {
  tenant_id = data.azurerm_client_config.current.tenant_id
  # https://stackoverflow.com/a/73918886/1977871
  # application_id = azuread_application.app.application_id
  object_id = azuread_service_principal.app_sp.object_id # Or just id instead of object_id, both are same.
  ...
}
```

- Apart from those two, an sql server and a database is also deployed. 

![Sql Server](./images/20AfterDeploymentReview40.jpg)

- Once the database is deployed, add your client ip address, see the image 20AfterDeploymentReview50.jpg

![Sql Server](./images/20AfterDeploymentReview50.jpg)

- Once the client address is added, try connecting to that database using SSMS. And then load the data. See the images 

![SSMS Connection](./images/20AfterDeploymentReview60.jpg)

![SSMS Connection](./images/20AfterDeploymentReview70.jpg)

- Once the database is ready with necessary data, collect the application object/service principal credentials. The steps needed are same as earlier example. 
  - The secret can be obtained from the command, terraform output app_name_password_value
  - You need to set them in this file. ./../../dotnet-apps/0280-AzureKeyVaultSecretsSqlAppAccess/Services/ProductService.cs 
  - You need to set them in this file. ./../../dotnet-apps/0285-AzureKeyVaultSecretsWebApiAccess/Services/ProductService.cs
  - The following are the variable you need to set.
```tf
var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
var clientId = "ab0adc88-52b7-4c2b-b47d-66814eb84af0";
var clientSecret = "0iO8Q~fsNhL97YRXpYcqLwIekgJziyOyfPRGPcA0";
var keyvaultUrl = "https://vivek-jgybpk-my-rg.vault.azure.net/";
```

- Then build and run.