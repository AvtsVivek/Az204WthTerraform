using Microsoft.Azure.Cosmos;


var cosmosDBEndpointUri = "https://vivek-hykcek-cosmos-db-account.documents.azure.com:443/";

var cosmosDBKey = "Tc5Rs3r3kme5JD5hcaBgwDiRLz1oDxwwESO9q2NjHHQEreoQKQOr00qOBWQgn187WXbeZB3DfrQQzOtzDBGUlg==";

var databaseName = "appdb";

var containerName = "Orders";

var partitionKey = "/categoryhere";

await CreateDatabase(databaseName);
await CreateContainer(databaseName, containerName, partitionKey);

async Task CreateDatabase(string databaseName)
{
    CosmosClient cosmosClient;
    cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    await cosmosClient.CreateDatabaseIfNotExistsAsync(databaseName);
    Console.WriteLine("Database created");
}

async Task CreateContainer(string databaseName, string containerName, string partitionKey)
{
    CosmosClient cosmosClient;
    cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    Database database = cosmosClient.GetDatabase(databaseName);

    await database.CreateContainerAsync(containerName, partitionKey);

    Console.WriteLine("Container created");

}