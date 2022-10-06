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
            var keyvaultUrl = "https://s-by-s-yuxxwo-keyvault.vault.azure.net/";
            var secretName = "sql-connection-string";

            var tokenCredential = new DefaultAzureCredential();
            var secretClient = new SecretClient(new Uri(keyvaultUrl), tokenCredential);

            var secret = secretClient.GetSecret(secretName);

            var connectionString = secret.Value.Value;

            return connectionString;
        }
     }
}
