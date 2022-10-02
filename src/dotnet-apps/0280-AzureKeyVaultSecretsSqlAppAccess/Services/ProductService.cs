using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using sqlapp.Models;
using System.Data.SqlClient;

namespace sqlapp.Services
{

    // This service will interact with our Product data in the SQL database
    public class ProductService
    {
        

        private SqlConnection GetConnection()
        {
            var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
            var clientId = "b9bd1be3-0324-4064-9c95-bfa44033ea5f";
            var clientSecret = "5t88Q~Avr8OogEcJhJduJLBs5uV6DXNUK0QiCate";
            var keyvaultUrl = "https://vivek-byorsi-keyvault.vault.azure.net/";
            var secretName = "sql-connection-string";
            var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);
            var secretClient = new SecretClient(new Uri(keyvaultUrl), clientSecretCredential);
            var secret = secretClient.GetSecret(secretName);
            var connectionString = secret.Value.Value;

            return new SqlConnection(connectionString);
        }
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

    }
}

