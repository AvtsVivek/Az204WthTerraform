using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace CosmosApp
{
    public class Order
    {
        public string id { get; set; } = default!;

        public string orderId { get; set; } = default!;

        public string category { get; set; } = default!;

        public int quantity { get; set; }
    }



}
