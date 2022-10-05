using AzureKeyVaultSecretsWebApiAccess.Models;
using Microsoft.AspNetCore.Mvc;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using System.Data.SqlClient;

namespace AzureKeyVaultSecretsWebApiAccess.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public ProductController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetProducts")]
        public List<Product> GetProducts()
        {
            List<Product> _product_lst = new List<Product>();
            string _statement = "SELECT ProductID,ProductName,Quantity from Products";
            SqlConnection _connection = GetConnection();

            _connection.Open();

            SqlCommand _sqlcommand = new SqlCommand(_statement, _connection);

            using (SqlDataReader _reader = _sqlcommand.ExecuteReader())
            {
                while (_reader.Read())
                {
                    Product _product = new Product()
                    {
                        ProductID = _reader.GetInt32(0),
                        ProductName = _reader.GetString(1),
                        Quantity = _reader.GetInt32(2)
                    };

                    _product_lst.Add(_product);
                }
            }
            _connection.Close();
            return _product_lst;
        }
        private SqlConnection GetConnection()
        {
            var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
            var clientId = "65f98051-cb4a-42ca-a563-253dd1e09ec5";
            var clientSecret = "HCA8Q~HqM3KEAjYtjnevAvs3N3bwn_aVyDDSmbxr";
            var keyvaultUrl = "https://s-by-s-uimbbx-keyvault.vault.azure.net/";
            var secretName = "sql-connection-string";
            var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);
            var secretClient = new SecretClient(new Uri(keyvaultUrl), clientSecretCredential);
            var secret = secretClient.GetSecret(secretName);
            var connectionString = secret.Value.Value;

            return new SqlConnection(connectionString);
        }
    }
}
