using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Api.Domain.Models
{
    public class ApiProductPriceAndStock: ApiProductPrice
    {
       public int Amount { get; private set; }

        public ApiProductPriceAndStock(string Symbol,
                                        string Unit,
                                        int VatRate,
                                        string VatType,
                                        List<ApiPrice> PriceList,
                                        int amount)
            : base(Symbol, Unit, VatRate, VatType, PriceList)
        {
            Amount = amount;
        }
    }
}
