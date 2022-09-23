// See https://aka.ms/new-console-template for more information

using Microsoft.Azure.Cosmos;

Console.WriteLine("Hello, World!");

var cosmosDBEndpointUri = "https://vivek-pmwcio-cosmos-db-account.documents.azure.com:443/";
var cosmosDBKey = "r2vxTL1U6GkmkdrqU8HMxzyORIsjclaDERb3tVdYoXNLr1OoCG58Nk7sKL5gCQZAIYy5SNijehiCvYZcmMGREA==";
var databaseName = "vivek-cosmos-sql-db";
var containerName = "vivek-cosmos-sql-db-category-container";

// await CreateDatabase("appdb");
var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

var container = cosmosClient.GetContainer(databaseName, containerName);

await CallStoredProcedure();

await AddNewItems();

async Task AddNewItems()
{
    dynamic[] orderItems = new dynamic[]
    {
        new {
            id = Guid.NewGuid().ToString(),
            orderId = "01",
            category  = "Laptop",
            quantity  = 100
        },
        new {
            id = Guid.NewGuid().ToString(),
            orderId = "02",
            category  = "Laptop",
            quantity  = 200
        },
        new {
            id = Guid.NewGuid().ToString(),
            orderId = "03",
            category  = "Laptop",
            quantity  = 75
        },
    };

    var result = await container.Scripts.ExecuteStoredProcedureAsync<string>("CreateItems", new PartitionKey("Laptop"), new[] { orderItems });

    Console.WriteLine(result);


}




async Task CallStoredProcedure()
{
    var result = await container.Scripts.ExecuteStoredProcedureAsync<string>("HelloWorld", new PartitionKey(""), null);

    Console.WriteLine(result);
}


