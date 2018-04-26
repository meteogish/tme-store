using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Domain.Models
{
    public class ProductPrice
    {
        public string Symbol { get; set; }
        public string Unit { get; set; }
        public int VatRate { get; set; }
        public string VatType { get; set; }
        public List<Price> PriceList { get; set; }

        public ProductPrice(string Symbol, string Unit, int VatRate, string VatType, List<Price> PriceList)
        {
            this.Symbol = Symbol;
            this.Unit = Unit;
            this.VatRate = VatRate;
            this.VatType = VatType;
            this.PriceList = PriceList;
        }
    }
}
