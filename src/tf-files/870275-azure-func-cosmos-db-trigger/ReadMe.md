# Table Storage

- Demos Cosmos Db trigger on Azure function.

- The config files when applied(plan, apply) then the following resources are created.

![Resource Group](./images/5ResourcesCreated1.jpg)

- Review the resources.

![CosmosDb Resource](./images/10AfterDeployingDbAccount1.jpg)

- Get the keys and then update the Program.cs file in the project dotnet-apps/0170-TableStorage/TableStorage/TableStorage.csproj

![CosmosDb Resource](./images/10AfterDeployingDbAccount2.jpg)

- Then run the following command to create db and populate with data.

```cs
dotnet build ./../../dotnet-apps/0170-TableStorage/TableStorage/TableStorage.csproj

dotnet run --project ./../../dotnet-apps/0170-TableStorage/TableStorage/TableStorage.csproj
```

![CosmosDb Resource](./images/20AfterDeployingDbAccountRunningApp1.jpg)

- Ensure the data is populated.

![CosmosDb Resource](./images/20AfterDeployingDbAccountRunningApp2.jpg)


- Now time to create Azure function.

![CosmosDb Resource](./images/30CreatingFunction1.jpg)

![CosmosDb Resource](./images/30CreatingFunction2.jpg)

![CosmosDb Resource](./images/30CreatingFunction3.jpg)

![CosmosDb Resource](./images/30CreatingFunction4.jpg)

![CosmosDb Resource](./images/30CreatingFunction5.jpg)

![CosmosDb Resource](./images/30CreatingFunction6.jpg)

![CosmosDb Resource](./images/30CreatingFunction7.jpg)

![CosmosDb Resource](./images/30CreatingFunction8.jpg)

- Now observe that a leases container is also crated.

![CosmosDb Resource](./images/40AddItemsToCosmosDb1.jpg)
 
- Now add items and observe

![CosmosDb Resource](./images/40AddItemsToCosmosDb2.jpg)

![CosmosDb Resource](./images/40AddItemsToCosmosDb5.jpg)

![CosmosDb Resource](./images/40AddItemsToCosmosDb6.jpg)

