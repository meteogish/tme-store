using System;
using System.Collections.Generic;
using System.Text;
using TME.Domain.Models;

namespace TME.Domain.Components
{
    public interface IPricesProvider
    {
        PriceResult GetPrices(String Currency, List<string> SymbolList);
    }
}
