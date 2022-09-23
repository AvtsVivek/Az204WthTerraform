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

async Task CallStoredProcedure()
{
    var result = await container.Scripts.ExecuteStoredProcedureAsync<string>("HelloWorld", new PartitionKey(""), null);

    Console.WriteLine(result);
}
