using Microsoft.Azure.Cosmos;
using CosmosApp;

// Notes:
// 1. Get the Azure Cosmos DB account uri.
// Go to the portal and then to Azure Cosmos DB account. In the overview, you should see the uri.
// 2. Now go to Keys tab. The pick the primary key. And then put it in cosmosDBKey.

var cosmosDBEndpointUri = "https://vivek-mbjgoc-cosmos-db-account.documents.azure.com:443/";

var cosmosDBKey = "Tn9RqcNdTyaIIjRNkcoS81mkDhsmCQZHsk7yXjYqHG2vbsu2UnKvZToun8oHDfYzjU5vKvSoPRQgbLy31ZvbKQ==";

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

await DeleteItems();

containerName = "Customers";

partitionKey = "/customerCity";

await CreateContainer(databaseName, containerName, partitionKey);

await AddItemToCustomerContainer("C1", "CustomerA", "New York",
    new List<Order>() {
    new Order
    {
        orderId = "O1",
        category = "Laptop",
        quantity = 100
    },
     new Order
     {
         orderId = "O2",
         category = "Mobile",
         quantity = 10
     } });

await AddItemToCustomerContainer("C2", "CustomerB", "Chicago",
    new List<Order>() {
    new Order
    {
        orderId = "O3",
        category = "Laptop",
        quantity = 20
    }});


await AddItemToCustomerContainer("C3", "CustomerC", "Miami",
    new List<Order>() {
    new Order
    {
        orderId = "O4",
        category = "Desktop",
        quantity = 30
    },
     new Order
     {
         orderId = "O5",
         category = "Mobile",
         quantity = 40
     } });


async Task DeleteItems()
{
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    var database = cosmosClient.GetDatabase(databaseName);
    var container = database.GetContainer(containerName);

    var orderId = "O2";
    var sqlQuery = $"SELECT o.id,o.category FROM Orders o WHERE o.orderId='{orderId}'";

    var id="";
    var category = "";

    var queryDefinition = new QueryDefinition(sqlQuery);
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

    while(feedIterator.HasMoreResults)
    {
        FeedResponse<Order> respose = await feedIterator.ReadNextAsync();
        foreach(Order order in respose)
        {
            id = order.id;
            category = order.category;
        }
    }
    
    // Lets just delete the item
    await container.DeleteItemAsync<Order>(id, new PartitionKey(category));
    Console.WriteLine("Item is deleted");
}

async Task ReplaceItems()
{
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    var database = cosmosClient.GetDatabase(databaseName);
    var container = database.GetContainer(containerName);

    var orderId = "O1";
    var sqlQuery = $"SELECT o.id,o.category FROM Orders o WHERE o.orderId='{orderId}'";
    var id="";
    var category = "";

    var queryDefinition = new QueryDefinition(sqlQuery);
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
    var orderResponse = await container.ReadItemAsync<Order>(id, new PartitionKey(category));

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
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

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
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    await cosmosClient.CreateDatabaseIfNotExistsAsync(databaseName);
    Console.WriteLine("Database created");
}

async Task CreateContainer(string databaseName, string containerName, string partitionKey)
{
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    var database = cosmosClient.GetDatabase(databaseName);

    await database.CreateContainerAsync(containerName, partitionKey);

    Console.WriteLine("Container created");

}

async Task AddItemToCustomerContainer(string customerId, string customerName, string customerCity, List<Order> orders)
{
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    var database = cosmosClient.GetDatabase(databaseName);
    var container = database.GetContainer(containerName);

    var customer = new Customer()
    {
        customerId = customerId,
        customerName = customerName,
        customerCity = customerCity,
        orders = orders
    };

    var response=await container.CreateItemAsync<Customer>(customer, new PartitionKey(customer.customerCity));

    Console.WriteLine("Added item with Customer Id {0}", customerId);
    Console.WriteLine("Request Units consumed {0}", response.RequestCharge);
}