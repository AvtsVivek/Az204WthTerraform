using Microsoft.Azure.Cosmos;
using CosmosDB;

// Notes:
// 1. Get the Azure Cosmos DB account uri.
// Go to the portal and then to Azure Cosmos DB account. In the overview, you should see the uri.
// 2. Now go to Keys tab. The pick the primary key. And then put it in cosmosDBKey.

var cosmosDBEndpointUri = "https://vivek-hykcek-cosmos-db-account.documents.azure.com:443/";

var cosmosDBKey = "bZFafilXBuoTRKEjRpo3Ai2uXIou3vFqjrSPZXy9b3ZjU8xlogEJOQNmE6wFmULbILHPEBp2LBeOYg7KTAjozA==";

var databaseName = "appdb";

var containerName = "Orders";

var partitionKey = "/category";

await CreateDatabase(databaseName);
await CreateContainer(databaseName, containerName, partitionKey);

await AddItem("O1", "Laptop", 100);
await AddItem("O2", "Mobiles", 200);
await AddItem("O3", "Desktop", 75);
await AddItem("O4", "Laptop", 25);

await ReplaceItems();

await ReadAllItems();

async Task ReplaceItems()
{
    CosmosClient cosmosClient;
    cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    Database database = cosmosClient.GetDatabase(databaseName);
    Container container = database.GetContainer(containerName);

    string orderId = "O1";
    string sqlQuery = $"SELECT o.id,o.category FROM Orders o WHERE o.orderId='{orderId}'";

    string id="";
    string category = "";

    QueryDefinition queryDefinition = new QueryDefinition(sqlQuery);
    using FeedIterator<Order> feedIterator = container.GetItemQueryIterator<Order>(queryDefinition);

    while(feedIterator.HasMoreResults)
    {
        FeedResponse<Order> respose = await feedIterator.ReadNextAsync();
        foreach(Order order in respose)
        {
            id = order.id;
            category = order.category;
        }
    }

    
    // Get the specific item first
    ItemResponse<Order> orderResponse = await container.ReadItemAsync<Order>(id, new PartitionKey(category));

    var item = orderResponse.Resource;
    item.quantity = 300;

    // Now let's replace the item
    await container.ReplaceItemAsync<Order>(item, item.id, new PartitionKey(item.category));
    Console.WriteLine("Item is updated");
}

async Task ReadAllItems()
{
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);
    var database = cosmosClient.GetDatabase(databaseName);
    var container = database.GetContainer(containerName);

    var sqlQuery = "SELECT o.orderId,o.category,o.quantity FROM Orders o";

    var queryDefinition = new QueryDefinition(sqlQuery);
    using FeedIterator<Order> feedIterator = container.GetItemQueryIterator<Order>(queryDefinition);

    while(feedIterator.HasMoreResults)
    {
        FeedResponse<Order> respose = await feedIterator.ReadNextAsync();
        foreach(Order order in respose)
        {
            Console.WriteLine("Order Id {0}", order.orderId);
            Console.WriteLine("Category {0}", order.category);
            Console.WriteLine("Quantity {0}", order.quantity);
        }
    }
}

async Task AddItem(string orderId,string category,int quantity)
{
    CosmosClient cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    var database = cosmosClient.GetDatabase(databaseName);
    var container = database.GetContainer(containerName);

    Order order = new Order()
    {
        id= Guid.NewGuid().ToString(),
        orderId = orderId,
        category = category,
        quantity = quantity
    };

    var response=await container.CreateItemAsync<Order>(order, new PartitionKey(order.category));

    Console.WriteLine("Added item with Order Id {0}", orderId);
    Console.WriteLine("Request Units consumed {0}", response.RequestCharge);

}

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