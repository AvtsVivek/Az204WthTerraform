
- This builds from the [earlier exmaple](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/700120-azure-func-dotnet), but adds a connection string.

- Once provisioned, add data to database.

- Deploy [this app - 0130-AzureFuncConnStringEnvVar](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0130-AzureFuncConnStringEnvVar)

- Note that this app, [doest contain a hard coded connection string. But instead picks from evn var](https://github.com/AvtsVivek/Az204WthTerraform/blob/f49e733549bb602b550b277247e01eeaf19624f6/src/dotnet-apps/0130-AzureFuncConnStringEnvVar/AzureFuncConnStringEnvVar/GetProduct.cs#L53).

- Run the terraform config files for provisioning web app, sql server and azure function app.

- Put data into Sql database.
  
- Next deploy [Azure Function App](https://github.com/AvtsVivek/Az204WthTerraform/blob/f49e733549bb602b550b277247e01eeaf19624f6/src/dotnet-apps/0130-AzureFuncConnStringEnvVar/AzureFuncConnStringEnvVar)

- Next Run [the web app locally](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0140-simple-webapp/WebAppToAzureFunc). Ensure the [connection string to Azure Function app is correct](https://github.com/AvtsVivek/Az204WthTerraform/blob/cbc6e2a45ea04c589c5285e14817d0375d7bbff4/src/dotnet-apps/0140-simple-webapp/WebAppToAzureFunc/Services/ProductService.cs#L51). Else it would not work.

- Finally deploy the web app to azure and check.