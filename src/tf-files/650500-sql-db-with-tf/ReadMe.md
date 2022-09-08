Sql Server and Sql Database

- Creates a Sql Server and Sql Database

- This is giving the following error.

```
azurerm_mssql_database.mssql_database: Creating...
╷
│ Error: creating/updating Database: (Name "hr-dev-ms-sql-db" / Server Name "hr-dev-ms-sql-server" / Resource Group "hr-dev-rg-vivrag-dtdwxd"): sql.DatabasesClient#CreateOrUpdate: Failure sending request: StatusCode=404 -- Original Error: Code="ParentResourceNotFound" Message="Can 
not perform requested operation on nested resource. Parent resource 'hr-dev-ms-sql-server' not found."
│
│   with azurerm_mssql_database.mssql_database,
│   on tf6-02-sql-server-db.tf line 20, in resource "azurerm_mssql_database" "mssql_database":
│   20: resource "azurerm_mssql_database" "mssql_database" {
│
╵
```

- So I raised [this github issue](https://github.com/hashicorp/terraform/issues/31755).
  
- 