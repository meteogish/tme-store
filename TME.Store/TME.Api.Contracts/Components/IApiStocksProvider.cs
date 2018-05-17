using System.Collections.Generic;
using TME.Store.Api.Models;

namespace TME.Store.Api.Components
{
    public interface IApiStocksProvider
    {
        List<ApiStock> GetStocks(List<string> symbolList);
    }
}
