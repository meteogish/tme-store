using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace TME.Store.Domain.Models
{
    public class ProductsResult
    {
        public PriceType PriceType { get; private set; }
        public string Currency { get; private set; }
        public IReadOnlyCollection<Product> Products { get; private set; }

        public ProductsResult(string priceType,
                                string currency,
                                IList<Product> products)
        {
            PriceType = (PriceType)Enum.Parse(typeof(PriceType), priceType);
            Currency = currency;
            Products = new ReadOnlyCollection<Product>(products);
        }
    }
}
