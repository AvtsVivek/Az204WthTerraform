using AzureKeyVaultSecretsWebApiAccess.Models;
using Microsoft.AspNetCore.Mvc;
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
            var _builder = new SqlConnectionStringBuilder();
            _builder.DataSource = db_source;
            _builder.UserID = db_user;
            _builder.Password = db_password;
            _builder.InitialCatalog = db_database;
            return new SqlConnection(_builder.ConnectionString);
        }
        private static string db_source = "hr-dev-ms-sql-server.database.windows.net";
        private static string db_user = "adm1n157r470r";
        private static string db_password = "4-v3ry-53cr37-p455w0rd";
        private static string db_database = "hr-dev-ms-sql-db";
    }
}
