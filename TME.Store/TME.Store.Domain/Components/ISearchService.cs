using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Domain.Models;

namespace TME.Store.Domain.Components
{
    public interface ISearchService
    {
        ProductsResult GetSearchedProducts(String symbol);
    }
}
