using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Api.Models
{
    public class ApiProductPrice
    {
        public string Symbol { get; set; }
        public string Unit { get; set; }
        public int VatRate { get; set; }
        public string VatType { get; set; }
        public List<ApiPrice> PriceList { get; set; }

        public ApiProductPrice(string Symbol, string Unit, int VatRate, string VatType, List<ApiPrice> PriceList)
        {
            this.Symbol = Symbol;
            this.Unit = Unit;
            this.VatRate = VatRate;
            this.VatType = VatType;
            this.PriceList = PriceList;
        }
    }
}
