using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiProductsProvider
    {
        List<ApiProduct> GetProducts(List<string> SymbolList);
    }
}
