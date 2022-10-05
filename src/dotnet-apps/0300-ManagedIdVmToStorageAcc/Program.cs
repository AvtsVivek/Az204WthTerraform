using Azure.Core;
using Azure.Identity;
using Azure.Storage.Blobs;

// This app runs on a linux vm and downloads a file in a container located on a storage account.
// The vm is configured with a SystemAssigned Managed Service identity.
// This identity is assigned the roles of Reader and Storage Blob Data Reader scoped to the storage account.

var blobURI = "https://staticwebsitezmzcut.blob.core.windows.net/content/index.html";
var filePath = "downloaded_file_index.html";

var tokenCredential = new DefaultAzureCredential();

try
{
    var blobClient = new BlobClient(new Uri(blobURI), tokenCredential);

    await blobClient.DownloadToAsync(filePath);

    Console.WriteLine("The blob is downloaded");
}
catch (Exception exception)
{
    Console.WriteLine("Error occured.");
    Console.WriteLine(exception.Message);
}

