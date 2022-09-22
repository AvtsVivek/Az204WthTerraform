using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace CosmosApp
{
    public class Customer
    {
        [JsonProperty("id")]
        public string customerId { get; set; } = default!;

        public string customerName { get; set; } = default!;
        public string customerCity { get; set; } = default!;
        public List<Order> orders { get; set; } = default!;
    }
}
