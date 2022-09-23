# Table Storage

- The attempt is to create a cosmos db account which is similar to the one created manually. But with Table Api and not Sql api

- We can add a database and container, but not item. 

- So we can add **azurerm_cosmosdb_sql_database** and in that we are enabling table api as follows.

```
capabilities {
  name = "EnableTable"
}
```

- If you want to create a new table manually using UI, then follow 2CreateTable1.jpg and 2CreateTable2.jpg

- Then add some entities to the table. See the images 2CreateTable3.jpg 4 and 5.

