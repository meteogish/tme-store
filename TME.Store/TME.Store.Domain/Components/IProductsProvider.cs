using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Domain.Models;

namespace TME.Store.Domain.Components
{
    public interface IProductsProvider
    {
        ProductsResult GetProducts(List<string> symbols);
        ProductsResult Search(string symbol);
    }
}
