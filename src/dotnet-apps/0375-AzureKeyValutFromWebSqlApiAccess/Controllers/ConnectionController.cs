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
            // var secretClient = new SecretClient(new Uri(AppConstants.KeyvaultUrl), new ManagedIdentityCredential());

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
