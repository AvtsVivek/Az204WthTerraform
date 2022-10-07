# Azure Key Vault

# WIP. Ignore this for now. So 

- The objective is to demo an dotnet 6 app accessing a connection string(any secret for that matter) which is present as a secret inside of a Azure Key Vault.

- This example extends a previous example. This example, deploys an Azure Key Vault. And then inside of it a secret. That secret will contain a connection string. 

- This example also deploys a application object along with a service principal. Necessary Access Policy is also configured on the key vault which allows access to this applicatioin object. Find the following in the code.

- This example is inspired from this example 890310-win-app-to-key-vault-sql-app. In 890310-win-app-to-key-vault-sql-app, we are using a windows app service. But in this example, we are using a Azure widnows function instead of Windows App Service. This is currently in complete. 