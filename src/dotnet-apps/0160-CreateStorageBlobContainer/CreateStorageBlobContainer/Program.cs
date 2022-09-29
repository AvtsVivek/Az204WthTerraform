using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Azure.Storage.Blobs.Specialized;
                   
var connectionString = "DefaultEndpointsProtocol=https;AccountName=staticwebsitemkxmzz;AccountKey=08SZxPIbMfoOPl1bd8loTt/dOJo51cvPqa5CIL1QtbRewDIMqxoq9f7SDRMeWXiB/zXFlECufA0e+AStzaMB+g==;EndpointSuffix=core.windows.net";

var containerName = "content1";

var blobServiceClient = new BlobServiceClient(connectionString);

Console.WriteLine("Creating the container");

await blobServiceClient.CreateBlobContainerAsync(containerName);

Console.WriteLine("Container creation complete");

var containerName2 = "content2";

Console.WriteLine("Creating the container");

await blobServiceClient.CreateBlobContainerAsync(containerName2, Azure.Storage.Blobs.Models.PublicAccessType.Blob);

Console.WriteLine("Container 2 creation complete");

var blobName = "data.sql";

var filePath = "data.sql";

var blobServiceClientForContainerContent1 = new BlobContainerClient(connectionString, containerName);

var blobClient = blobServiceClientForContainerContent1.GetBlobClient(blobName);
await blobClient.UploadAsync(filePath, true);

Console.WriteLine("Uploaded the blob");

var blobContainerClient = new BlobContainerClient(connectionString, containerName);

await foreach (BlobItem blobItem in blobContainerClient.GetBlobsAsync())
{
    Console.WriteLine("The Blob Name is {0}", blobItem.Name);
    Console.WriteLine("The Blob Size is {0}", blobItem.Properties.ContentLength);
}

await SetBlobMetaData(blobName);

// You can download as follows. 
// Use the same client(blobClient) or create a new one
blobClient = new BlobClient(connectionString, containerName, blobName);

filePath = "data1.sql";

Console.WriteLine($"Download of {filePath} begins.");

var response = await blobClient.DownloadToAsync(filePath);

Console.WriteLine($"Download of {filePath} Ends.");

await GetMetaData(blobName);

await AcquireLease(blobName);


async Task SetBlobMetaData(string blobName)
{
    var blobClient = new BlobClient(connectionString, containerName, blobName);

    var metaData = new Dictionary<string, string>();
    metaData.Add("Department", "Logistics");
    metaData.Add("Application", "AppA");

    await blobClient.SetMetadataAsync(metaData);

    Console.WriteLine("Metadata added");
}

async Task GetMetaData(string blobName)
{
    var blobClient = new BlobClient(connectionString, containerName, blobName);
    var blobProperties = await blobClient.GetPropertiesAsync();

    foreach (var metaData in ((BlobProperties)blobProperties).Metadata)
    {
        Console.WriteLine("The key is {0}", metaData.Key);
        Console.WriteLine("The value is {0}", metaData.Value);
    }
}

async Task AcquireLease(string blobName)
{
    var blobClient = new BlobClient(connectionString, containerName, blobName);

    var blobLeaseClient = blobClient.GetBlobLeaseClient();
    var leaseTime = new TimeSpan(0, 0, 1, 00);
    var response = await blobLeaseClient.AcquireAsync(leaseTime);

    Console.WriteLine("Lease id is {0}", response.Value.LeaseId);
    Console.WriteLine($"Lease acquired for {leaseTime.TotalSeconds} secs. Verify on the portal");
}