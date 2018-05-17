using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiStocksProvider
    {
        List<ApiStock> GetStocks(List<string> symbolList);
    }
}
