using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Data;

namespace sqlfunction;

public static class AddProduct
{
    [FunctionName("AddProduct")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        Product data = JsonConvert.DeserializeObject<Product>(requestBody);

        SqlConnection connection = GetConnection();

        connection.Open();

        string statement = "INSERT INTO Products(ProductID,ProductName,Quantity) VALUES(@param1,@param2,@param3)";

        using (SqlCommand command = new SqlCommand(statement, connection))
        {
            command.Parameters.Add("@param1", SqlDbType.Int).Value = data.ProductID;
            command.Parameters.Add("@param2", SqlDbType.VarChar, 1000).Value = data.ProductName;
            command.Parameters.Add("@param3", SqlDbType.Decimal).Value = data.Quantity;
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();

        }

        return new OkObjectResult("Course added");
    }
    private static SqlConnection GetConnection()
    {
        //var connectionString = "Server=tcp:appserver300030.database.windows.net,1433;Initial Catalog=appdb;Persist Security Info=False;User ID=sqladmin;Password=Azure@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        //var connectionString = "Server=tcp:hr-dev-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        var connectionString = Environment.GetEnvironmentVariable("SQLAZURECONNSTR_SQLConnection");
        return new SqlConnection(connectionString);
    }
}


