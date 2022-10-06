namespace sqlapp.Models
{
    public class Product
    {
        public int ProductID { get; set; } = default!;
        public string ProductName { get; set; } = default!;
        public int Quantity { get; set; } = default!;
    }
}
