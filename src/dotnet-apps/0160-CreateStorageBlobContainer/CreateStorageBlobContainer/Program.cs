using Azure.Storage.Blobs;

string connectionString = "DefaultEndpointsProtocol=https;AccountName=newstore4665656;AccountKey=PU5gM5j1PbuRPmiVIMmxCSikAOKfLJc+uEoa7qJ4kSzAy6U0fbSdl7fpnsx610W+9/0JlXEtwKDJ3fJl2guAPw==;EndpointSuffix=core.windows.net";
string containerName = "data1";

BlobServiceClient blobServiceClient = new BlobServiceClient(connectionString);

Console.WriteLine("Creating the container");

await blobServiceClient.CreateBlobContainerAsync(containerName);

/*
If you want to specify properties for the container

await blobServiceClient.CreateBlobContainerAsync(containerName,Azure.Storage.Blobs.Models.PublicAccessType.Blob);
*/
Console.WriteLine("Container creation complete");