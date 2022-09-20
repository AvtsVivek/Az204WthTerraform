# Table Storage

```
resource "azurerm_storage_table" "example" {
  name                 = "mysampletable"
  storage_account_name = azurerm_storage_account.storage_account.name
}

```

- The config above creates the following resources.

![Table Storage](./images/1TableStorage1.jpg)

- Once deployed, get the connection string.

![Table Storage](./images/1TableStorage2.jpg)



![Table Storage](./images/1TableStorage3.jpg)

![Table Storage](./images/1TableStorage4.jpg)

![Table Storage](./images/1TableStorage5.jpg)

