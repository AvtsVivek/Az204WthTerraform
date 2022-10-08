using AzureKeyVaultSecretsWebApiAccess.Models;
using Microsoft.AspNetCore.Mvc;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using System.Data.SqlClient;
using AzureKeyValutFromWebSqlApiAccess;

namespace AzureKeyValutFromWebApiAccess.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ConnectionController
    {
        [HttpGet(Name = "GetConnectionString")]
        public string GetConnectionString()
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
                return connectionString;
            }
            catch (Exception exception)
            {
                return "Failure: " + exception.Message;
            }
        }
     }
}
