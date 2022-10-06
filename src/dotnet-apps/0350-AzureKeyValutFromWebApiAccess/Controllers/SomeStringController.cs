using AzureKeyVaultSecretsWebApiAccess.Models;
using Microsoft.AspNetCore.Mvc;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using System.Data.SqlClient;

namespace AzureKeyValutFromWebApiAccess.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class SomeStringController
    {
        [HttpGet(Name = "GetSomeString")]
        public string GetSomeString()
        {
            return "Here is some string!";
        }
    }
}
