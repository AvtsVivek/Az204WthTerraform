using AzureKeyVaultSecretsWebApiAccess.Models;
using Microsoft.AspNetCore.Mvc;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using System.Data.SqlClient;
using AzureKeyValutFromWebSqlApiAccess;

namespace AzureKeyVaultSecretsWebApiAccess.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        public ProductController()
        {

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
            var secretName = "sql-connection-string";

            var tokenCredential = new DefaultAzureCredential();
            var secretClient = new SecretClient(new Uri(AppConstants.KeyvaultUrl), tokenCredential);

            var secret = secretClient.GetSecret(secretName);

            var connectionString = secret.Value.Value;

            return new SqlConnection(connectionString);
        }
    }
}
