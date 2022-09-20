
using Azure.Data.Tables;

string connectionString = "DefaultEndpointsProtocol=https;AccountName=staticwebsiteqmvtgi;AccountKey=PVqBjgwnvGRaVqqa93o0LYs4JGbP+vCfyGjBWVeNr58UnfsSKS9L7/jPXYOVc39jLUMVngTTmheb+AStAtXz6A==;EndpointSuffix=core.windows.net";
string tableName = "mysampletable";

//entity = {
//    Price = "100"
//    PriceUnit = "Indian Rs"
//    Quantity = "1"
//    QuantityUnit = "Kg"

//  }

AddEntity("O1", "Apples", 100, "Indian Rs", 1, "Kg");
AddEntity("O2", "Rice", 2000, "Indian Rs", 50, "Kg");
AddEntity("O3", "Cabbage", 50, "Indian Rs", 5, "Kg");
AddEntity("O4", "Cooking Oil", 250, "Indian Rs", 5, "Liter");

void AddEntity(string iD, string category, int price, string priceUnits, int quantity, string quantityUnits)
{
    TableClient tableClient = new TableClient(connectionString, tableName);

    TableEntity tableEntity = new TableEntity(category, iD)
    {
        {"quantity", quantity},
        {"quantityUnits", quantityUnits},
        {"price", price},
        {"priceUnits", priceUnits},
    };

    tableClient.AddEntity(tableEntity);
    Console.WriteLine("Added Entity with order ID {0}", iD);
}