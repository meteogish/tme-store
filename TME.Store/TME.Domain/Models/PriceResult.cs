using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Domain.Models
{
     public enum PriceType { NET, GROSS };

    public class PriceResult
    {
        public string Language { get; set; }
        public string Currency { get; set; }
        public PriceType PriceType;
         public List<ProductPrice> ProductList{ get; set; }

        public PriceResult(string Language,string Currency , PriceType PriceType, List<ProductPrice> ProductLis)
        {
            this.Language = Language;
            this.Currency = Currency;
            this.PriceType = PriceType;
            this.ProductList = ProductList;

        }

    }


}
