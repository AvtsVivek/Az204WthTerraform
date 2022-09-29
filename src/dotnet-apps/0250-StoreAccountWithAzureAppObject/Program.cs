using Azure.Identity;
using Azure.Storage.Blobs;


var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
var clientId = "15ccfa0d-dd61-4c3a-993e-6f5636bb4d9d";
var clientSecret = "Wid8Q~4iN2N0vaeMAYjKAoLJBNbN01qNWEMrXaic";
var blobURI = "https://staticwebsitetrndov.blob.core.windows.net/content/error.html";
var filePath = "error1.html";

var clientCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);

var blobClient = new BlobClient(new Uri(blobURI), clientCredential);

await blobClient.DownloadToAsync(filePath);

Console.WriteLine("The blob is downloaded");