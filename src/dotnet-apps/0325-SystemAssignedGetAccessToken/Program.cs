using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http.Headers;

// https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-token#get-a-token-using-http

var tokenUri = "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://storage.azure.com";
var httpClient = new HttpClient();
httpClient.DefaultRequestHeaders.Add("Metadata", "true");

var response = await httpClient.GetAsync(tokenUri);
var content = await response.Content.ReadAsStringAsync();

Console.WriteLine("The full content");
Console.WriteLine(content);

var values = JsonConvert.DeserializeObject<Dictionary<string,string>>(content)!;

foreach(KeyValuePair<string,string> pair in values)
{
    Console.WriteLine("Key is " + pair.Key);
    Console.WriteLine("Value is " + pair.Value);
}


Console.WriteLine(values["access_token"]);
// We can now access the blob
var applicationUri = "https://staticwebsitezdmdcy.blob.core.windows.net/content/index.html";
var httpClientStorage = new HttpClient();

httpClientStorage.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", values["access_token"]);
httpClientStorage.DefaultRequestHeaders.Add("x-ms-version", "2017-11-09");

var blobResponse = await httpClientStorage.GetAsync(applicationUri);
var blobContent = await blobResponse.Content.ReadAsStringAsync();

Console.WriteLine(blobContent);
Console.WriteLine("Thats it.");
Console.WriteLine("Press any key to exit the app.");
Console.Read();