using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Domain.Models
{
    public class SearchProductsResult : ProductsResult
    {
        public int PageCount { get; private set; }

        public SearchProductsResult(string priceType, string currency, IList<Product> products, int pageCount) 
            : base(priceType, currency, products)
        {
            PageCount = pageCount;
        }
    }
}
