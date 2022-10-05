namespace AzureKeyVaultSecretsWebApiAccess.Models
{
    public class Product
    {
        public int ProductID { get; set; } = default(int);
        public string ProductName { get; set; } = default!;
        public int Quantity { get; set; } = 0;
    }
}
