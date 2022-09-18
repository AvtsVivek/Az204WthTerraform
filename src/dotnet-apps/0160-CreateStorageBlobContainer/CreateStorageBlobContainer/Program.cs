using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;

var connectionString = "DefaultEndpointsProtocol=https;AccountName=staticwebsitenishaq;AccountKey=R3xES6YaCwlsbiUyYiOycxTVFj8l4Z9RlsjP7FtV1xIoI4+0vjqKw4Bed4psVranGDOLHFK3V75w+ASt4YrXPg==;EndpointSuffix=core.windows.net";

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

// You can download as follows. 
// Use the same client(blobClient) or create a new one
blobClient = new BlobClient(connectionString, containerName, blobName);

filePath = "data1.sql";

var response = await blobClient.DownloadToAsync(filePath);

