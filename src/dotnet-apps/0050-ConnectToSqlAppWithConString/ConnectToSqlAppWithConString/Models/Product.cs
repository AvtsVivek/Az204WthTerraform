namespace sqlapp.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; } = default!;
        public int Quantity { get; set; }
    }
}
