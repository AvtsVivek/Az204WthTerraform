- In this example we will deploy an azure functioin app, which will get product by id.

- This builds on the previous example [800110-azure-sql-func-remote](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/800110-azure-sql-func-remote). But addes one more function of getting product by ID.

- This demos builds on the previouos example. This adds azure function on which the [dotnet azure function app](https://github.com/AvtsVivek/Az204WthTerraform/blob/a0f1b5f1a7168f6fe576e3ecad4d6e637763d0ba/src/dotnet-apps/0100-AzureFuncGetProductsFromSqlDb) is deployed.

- Furthermore, this Adds a product as well. If you deploy [this dotnet app, it contains a AddProduct](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0120-AzureFuncAddProduct) function as well.