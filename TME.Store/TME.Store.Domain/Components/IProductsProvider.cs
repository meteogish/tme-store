using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Domain.Models;

namespace TME.Store.Domain.Components
{
    public interface IProductsProvider
    {
        SearchProductsResult Search(string searchText, int page);
    }
}
