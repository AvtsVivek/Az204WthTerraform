using Azure.Storage.Blobs;

var connectionString = "DefaultEndpointsProtocol=https;AccountName=staticwebsitenishaq;AccountKey=a2qP3tD5Rtin4EtSRRvwxAZafE38I9F8WyDvodoCqkdEtVMCy6zMozFlqG4nGj2OjzVKuHe342qe+AStpAh1zg==;EndpointSuffix=core.windows.net";

var containerName = "content1";

var blobServiceClient = new BlobServiceClient(connectionString);

Console.WriteLine("Creating the container");

await blobServiceClient.CreateBlobContainerAsync(containerName);

Console.WriteLine("Container creation complete");

var containerName2 = "content2";

Console.WriteLine("Creating the container");

await blobServiceClient.CreateBlobContainerAsync(containerName2, Azure.Storage.Blobs.Models.PublicAccessType.Blob);

Console.WriteLine("Container 2 creation complete");
