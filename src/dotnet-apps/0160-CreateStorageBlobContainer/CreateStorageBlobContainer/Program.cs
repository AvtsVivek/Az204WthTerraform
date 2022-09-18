using Azure.Storage.Blobs;

var connectionString = "DefaultEndpointsProtocol=https;AccountName=staticwebsitenishaq;AccountKey=l2XMSaoxhxAGgwIMdh1L03S5B34WDa+Dvw0JBIRGqGuQpL+f0STbb/5VI/w46jQfsbUFwrWIjeQ8+AStGnb6SA==;EndpointSuffix=core.windows.net";

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

