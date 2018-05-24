using System;
using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiPricesProvider
    {
        ApiPriceResult<ApiProductPrice> GetPrices(List<string> SymbolList);
    }
}
