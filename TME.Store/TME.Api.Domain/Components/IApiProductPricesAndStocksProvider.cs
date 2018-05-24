using System;
using System.Collections.Generic;
using System.Text;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{

    public interface IApiProductPricesAndStocksProvider
    {
        ApiPriceResult<ApiProductPriceAndStock> GetPricesAndStocks(List<string> SymbolList);
    }


}
