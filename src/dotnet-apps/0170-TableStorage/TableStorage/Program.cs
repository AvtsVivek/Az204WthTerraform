using Azure;
using Azure.Data.Tables;

// Note this same app is used in the following two examples.
// https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/870225-cosmos-table-api-dotnet-access
// https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/860525-table-storage-access-with-dotnet
// Take a look at this file
// https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/870225-cosmos-table-api-dotnet-access/commands.sh
// https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/tf-files/860525-table-storage-access-with-dotnet/commands.sh
// The connection string needs to be updated, and the table name.

// Update the correct connection string. Also update the correct table name here. Else this would not work.
var connectionString = "DefaultEndpointsProtocol=https;AccountName=vivek-pmwcio-cosmos-db-account;AccountKey=2GaLtM63DA1qDOF1UT8ak68R2vIkFNxZeCL24u6oRyCP1n4an68JUi9LWAf1BBWR5dPot1qX9jw26fIlwFapUg==;TableEndpoint=https://vivek-pmwcio-cosmos-db-account.table.cosmos.azure.com:443/";
var tableName = "vivek-cosmos-table-db";

AddEntity("O1", "Apples", 100, "Indian Rs", 1, "Kg");
AddEntity("O2", "Rice", 2000, "Indian Rs", 50, "Kg");
AddEntity("O3", "Cabbage", 50, "Indian Rs", 5, "Kg");
AddEntity("O4", "Cooking Oil", 250, "Indian Rs", 5, "Liter");

DeleteEntity("O4", "Cooking Oil");

QueryEntity("Cabbage");

void AddEntity(string iD, string category, int price, string priceUnits, int quantity, string quantityUnits)
{
    var tableClient = new TableClient(connectionString, tableName);

    var tableEntity = new TableEntity(category, iD)
    {
        {"quantity", quantity},
        {"quantityUnits", quantityUnits},
        {"price", price},
        {"priceUnits", priceUnits},
    };

    tableClient.AddEntity(tableEntity);
    Console.WriteLine("Added Entity with order ID {0}", iD);
}

void DeleteEntity(string iD, string category)
{
    var tableClient = new TableClient(connectionString, tableName);
    tableClient.DeleteEntity(category, iD);
    Console.WriteLine("Entity with Partition Key {0} and Row Key {1} deleted", category, iD);
}

void QueryEntity(string category)
{
    TableClient tableClient = new TableClient(connectionString, tableName);

    Pageable<TableEntity> results = tableClient.Query<TableEntity>(entity => entity.PartitionKey == category);

    foreach (TableEntity tableEntity in results)
    {
        Console.WriteLine("Order Id {0}", tableEntity.RowKey);
        Console.WriteLine("Quantity is {0}", tableEntity.GetInt32("quantity"));
    }
}