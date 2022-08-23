using sqlapp.Models;

namespace sqlapp.Services
{
    //public interface IProductService
    //{
    //    List<Product> GetProducts();
    //}

    public interface IProductService
    {
        Task<List<Product>> GetProducts();
    }

}