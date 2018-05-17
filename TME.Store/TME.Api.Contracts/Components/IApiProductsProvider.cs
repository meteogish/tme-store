using System.Collections.Generic;
using TME.Store.Api.Models;
namespace TME.Store.Api.Components
{
   public interface IApiProductsProvider
    {
        List<ApiProduct> GetProducts(List<string> SymbolList);
    }
}
