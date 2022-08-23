- This demonistrates deployment slots. 

- This builds on (earlier example)[https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/650940-web-with-db-deployment-slots] but with only sql resources. 

- This provisions sql server with database. Then you have to allow access to the clinet. See the images.

- Create table and add data to the database. 

- Get the connection string

```
string connectionString = "Server=tcp:appserver6000.database.windows.net,1433;Initial Catalog=appdb;Persist Security Info=False;User ID=sqlusr;Password=Azure@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
```

- The database name, login credentials should be correct. Else the connection will not open. 

- [Get the connection string and paste it in the app0100-AzureFuncGetProductsFromSqlDb application](https://github.com/AvtsVivek/Az204WthTerraform/blob/a0f1b5f1a7168f6fe576e3ecad4d6e637763d0ba/src/dotnet-apps/0100-AzureFuncGetProductsFromSqlDb/AzureFuncGetProductsFromSqlDb/GetProduct.cs#L52).

- 