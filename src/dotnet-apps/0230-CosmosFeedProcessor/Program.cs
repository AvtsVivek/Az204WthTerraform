
using CosmosDB;
using Microsoft.Azure.Cosmos;

var cosmosDBEndpointUri = "https://vivek-uydahy-cosmos-db-account.documents.azure.com:443/";
var cosmosDBKey = "RPB89Nnh1drAL93OfOtr3mcJAn0SgznPBM4AfFokGVdd3Rv93C5EOxGHsY5cLhNTQVpC35fCMIJwMHq0MEddPA==";
var databaseName = "vivek-cosmos-sql-db";
var sourcecontainerName = "vivek-cosmos-sql-db-grocery-source-container";
var leasecontainerName = "leases";

await StartChangeProcessor();

async Task StartChangeProcessor()
{
    var cosmosClient = new CosmosClient(cosmosDBEndpointUri, cosmosDBKey);

    var leaseContainer = cosmosClient.GetContainer(databaseName, leasecontainerName);
    
    var changeFeedProcessor = cosmosClient.GetContainer(databaseName, sourcecontainerName)
        .GetChangeFeedProcessorBuilder<GroceryStore>(processorName:"ManageChanges", 
        onChangesDelegate: ManageChanges)
        .WithInstanceName("appHost")
        .WithLeaseContainer(leaseContainer)
        .Build();

    Console.WriteLine("Starting the Change Feed Processor");
    try
    {
        await changeFeedProcessor.StartAsync();
    }
    catch (Exception exception)
    {
        Console.WriteLine(exception.Message);
    }

    Console.WriteLine("Waiting for the feed.");
    Console.Read();
    await changeFeedProcessor.StopAsync();
}

static async Task ManageChanges(ChangeFeedProcessorContext context,
    IReadOnlyCollection<GroceryStore> itemCollection,
    CancellationToken cancellationToken)
{
    foreach(GroceryStore item in itemCollection)
    {
        Console.WriteLine($"Id {item.id}");
        Console.WriteLine($"Grocery Id {item.groceryId}");
        Console.WriteLine($"Item Name {item.ItemName}");
        Console.WriteLine($"Quantity {item.quantity}");
        Console.WriteLine($"Category {item.category}");
        Console.WriteLine($"Creation Time {item.creationTime}");

        // The following is to just make things async.
        await Task.Delay(2);
    }
}