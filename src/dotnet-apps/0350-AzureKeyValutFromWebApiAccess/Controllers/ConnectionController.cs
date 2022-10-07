using AzureKeyVaultSecretsWebApiAccess.Models;
using Microsoft.AspNetCore.Mvc;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using System.Data.SqlClient;

namespace AzureKeyValutFromWebApiAccess.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ConnectionController
    {
        [HttpGet(Name = "GetConnectionString")]
        public string GetConnectionString()
        {
            var keyvaultUrl = "https://s-by-s-imaoon-keyvault.vault.azure.net/";
            var secretName = "sql-connection-string";

            var tokenCredential = new DefaultAzureCredential();
            var secretClient = new SecretClient(new Uri(keyvaultUrl), tokenCredential);
            // https://github.com/Azure/azure-sdk-for-net/issues/13564#issuecomment-660431926
            // https://github.com/Azure/azure-sdk-for-net/issues/11400#issuecomment-620179175

            // var tokenCredential = new DefaultAzureCredential(new DefaultAzureCredentialOptions { ManagedIdentityClientId = "bc783ad4-77a7-4d5d-9151-8e9aad5d9fec" });

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
