using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;


namespace AzureFuncKeyVaultSqlDb
{
    public static class GetProduct
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

        [FunctionName("GetProduct")]
        public static async Task<IActionResult> GetProducts(
            [HttpTrigger(AuthorizationLevel.Function, "get")] HttpRequest req, ILogger log)
        {
            log.LogInformation("Get data from the database");
            var _product_lst = new List<Product>();
            var _statement = "SELECT ProductID,ProductName,Quantity from Products";
            var _connection = await GetConnection();

            _connection.Open();

            var _sqlcommand = new SqlCommand(_statement, _connection);

            using (SqlDataReader _reader = _sqlcommand.ExecuteReader())
            {
                while (_reader.Read())
                {
                    var _product = new Product()
                    {
                        ProductID = _reader.GetInt32(0),
                        ProductName = _reader.GetString(1),
                        Quantity = _reader.GetInt32(2)
                    };

                    _product_lst.Add(_product);
                }
            }
            _connection.Close();            

            return new OkObjectResult(_product_lst);
        }

        private static async Task<SqlConnection> GetConnection()
        {
            // var connectionString = "Server=tcp:hr-dev-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
            var connectionString = await GetConnectionStringFromKeyVault();
            return new SqlConnection(connectionString);
        }

        private static async Task<string> GetConnectionStringFromKeyVault()
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
