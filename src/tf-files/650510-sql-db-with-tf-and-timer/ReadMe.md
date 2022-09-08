Sql Server and Sql Database

- Creates a Sql Server and Sql Database

- This is based on [the previoous one](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/650500-sql-db-with-tf)
  
- But that is giving error.
  
- So I raised [this github issue](https://github.com/hashicorp/terraform/issues/31755).

- Now found a work arund and seems to be working.

- Based on [the sleep terraform timer resource here](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep), I added a timer to the config.

```
resource "time_sleep" "wait_for_some_time" {
  depends_on      = [azurerm_mssql_server.mssql_server]
  create_duration = "30s"
}
```
  
