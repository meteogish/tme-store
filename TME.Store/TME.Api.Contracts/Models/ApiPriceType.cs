using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Api.Models
{
     public enum ApiPriceType { NET, GROSS };

    public class ApiPriceResult
    {
        public string Language { get; set; }
        public string Currency { get; set; }
        public ApiPriceType PriceType;
         public List<ApiProductPrice> ProductList{ get; set; }

        public ApiPriceResult(string Language,string Currency , ApiPriceType PriceType, List<ApiProductPrice> ProductLis)
        {
            this.Language = Language;
            this.Currency = Currency;
            this.PriceType = PriceType;
            this.ProductList = ProductList;

        }

    }


}
