using Azure.Identity;
using Azure.Storage.Blobs;


var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
var clientId = "b51a4f4d-d3f9-4421-b87b-ee9777571572";
var clientSecret = "Kik8Q~~kueC-5aN952eHNaMPAb6cdB7-Cs7u0bIz";
var blobURI = "https://staticwebsitemkxmzz.blob.core.windows.net/content/error.html";
var filePath = "error1.html";

var clientCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);

var blobClient = new BlobClient(new Uri(blobURI), clientCredential);

await blobClient.DownloadToAsync(filePath);

Console.WriteLine("The blob is downloaded");