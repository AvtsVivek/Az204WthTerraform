using sqlapp.Models;
using System.Text.Json;

namespace sqlapp.Services
{

    // This service will interact with our Product data in the SQL database
    public class ProductService : IProductService
    {
        // private readonly IConfiguration _configuration;
        public ProductService(IConfiguration configuration)
        {
            // _configuration = configuration;
        }
        //private SqlConnection GetConnection()
        //{
        //    var connectionString = _configuration["SQLConnection"];
        //    return new SqlConnection(connectionString);
        //}

        //public List<Product> GetProducts()
        //{
        //    List<Product> _product_lst = new List<Product>();
        //    string _statement = "SELECT ProductID,ProductName,Quantity from Products";
        //    SqlConnection _connection = GetConnection();

        //    _connection.Open();

        //    SqlCommand _sqlcommand = new SqlCommand(_statement, _connection);

        //    using (SqlDataReader _reader = _sqlcommand.ExecuteReader())
        //    {
        //        while (_reader.Read())
        //        {
        //            Product _product = new Product()
        //            {
        //                ProductID = _reader.GetInt32(0),
        //                ProductName = _reader.GetString(1),
        //                Quantity = _reader.GetInt32(2)
        //            };

        //            _product_lst.Add(_product);
        //        }
        //    }
        //    _connection.Close();
        //    return _product_lst;
        //}

        public async Task<List<Product>> GetProducts()
        {
            var functionURL = "https://hr-dev-win-func-app-mucisi.azurewebsites.net/api/GetProducts?code=5BrB59-D_cM6IuzXqyfR03HFBYfqytCSR92dd2qaM2yVAzFu0v-h8Q==";

            using (var _client = new HttpClient())
            {
                HttpResponseMessage _response = await _client.GetAsync(functionURL);
                string _content = await _response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<List<Product>>(_content)!;
            }
        }
    }
}

