using System.Collections.Generic;
using TME.Domain.Models;

namespace TME.Domain.Components
{
    public interface IStocksProvider
    {
        List<Stock> GetStocks(List<string> symbolList);
    }
}
