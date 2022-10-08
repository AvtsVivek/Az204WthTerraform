using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using System.Data.SqlClient;

namespace AzureFuncKeyVaultAccess
{
    public static class Function1
    {
        [FunctionName("Function1")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            string name = req.Query["name"];

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            name = name ?? data?.name;

            string responseMessage = string.IsNullOrEmpty(name)
                ? "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response."
                : $"Hello, {name}. This HTTP triggered function executed successfully.";

            return new OkObjectResult(responseMessage);
        }

        [FunctionName("GetSomeString")]
        public static async Task<IActionResult> GetSomeString(
        [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req, ILogger log)
        {
            // var connString = await Task.Run(() => GetConnectionString());
            var connString = await Task.Run(() => "Here we go ...");
            return new OkObjectResult(connString);
        }

        [FunctionName("GetConnectionString")]
        public static async Task<IActionResult> GetConnectionString(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req, ILogger log)
        {
            //var connString = await Task.Run(() => GetConnectionString());
            var connString = await GetConnectionStringFromKeyVault();
            return new OkObjectResult(connString);
        }

        public static async Task<string> GetConnectionStringFromKeyVault()
        {
            var secretName = "sql-connection-string";

            var tokenCredential = new DefaultAzureCredential();
            var secretClient = new SecretClient(new Uri(AppConstants.KeyvaultUrl), tokenCredential);

            // In order to use a user assigned identity with the DefaultAzureCredential you must
            // specify the client id of the user assigned identity.
            // You can do this either by passing it in code via
            // DefaultAzureCredentialOptions.ManagedIdentityClientId like so:
            // var tokenCredential = new DefaultAzureCredential(new DefaultAzureCredentialOptions { ManagedIdentityClientId = "bc783ad4-77a7-4d5d-9151-8e9aad5d9fec" });
            // Alternatively you can also specify the client id to be used via the AZURE_CLIENT_ID environment variable.
            // https://github.com/Azure/azure-sdk-for-net/issues/13564#issuecomment-660431926
            // https://github.com/Azure/azure-sdk-for-net/issues/11400#issuecomment-620179175
            // For our case, we will be setting env var AZURE_CLIENT_ID in the terraform config file.
            // See this.
            // https://github.com/AvtsVivek/Az204WthTerraform/blob/fe7c0348adb9b3cb190d5ffc5679d47179dec6fa/src/tf-files/890305-win-app-to-key-vault-user-assigned/tf10-2-win-web-app.tf#L33

            try
            {
                var secret = secretClient.GetSecret(secretName);
                var connectionString = secret.Value.Value;
                return await Task.Run(() => connectionString);
                //return connectionString;
            }
            catch (Exception exception)
            {
                return await Task.Run(() => "Failure: " + exception.Message);
            }
        }

    }
}
