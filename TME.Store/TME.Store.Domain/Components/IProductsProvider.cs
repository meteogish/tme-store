using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Domain.Models;

namespace TME.Store.Domain.Components
{
    public interface IProductsProvider
    {
        ProductsResult GetProducts(List<string> symbols);
        SearchProductsResult Search(string symbol, int page);
    }
}
