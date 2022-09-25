using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CosmosDB
{
    public class Order
    {
        public string id { get; set; } = default!;

        public string orderId { get; set; } = default!;
        public DateTime creationTime    { get; set; }
    }

    public class GroceryStore
    {
        public string id { get; set; } = default!;

        public string groceryId { get; set; } = default!;
        public string ItemName { get; set; } = default!;
        public string category { get; set; } = default!;
        public int quantity { get; set; }
        public DateTime creationTime { get; set; }

        /*
         
    "groceryId": "O1",
    "ItemName": "Shimla Apples",
    "category": "Fruits",
    "quantity": 100,

        */ 
    }
}
