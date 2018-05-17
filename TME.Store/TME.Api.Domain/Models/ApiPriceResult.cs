using System.Collections.Generic;

namespace TME.Api.Domain.Models
{
    public class ApiPriceResult
    {
        public string Language { get; set; }
        public string Currency { get; set; }
        public string PriceType { get; set; }
         public List<ApiProductPrice> ProductList{ get; set; }

        public ApiPriceResult(string Language,string Currency , string PriceType, List<ApiProductPrice> ProductLis)
        {
            this.Language = Language;
            this.Currency = Currency;
            this.PriceType = PriceType;
            this.ProductList = ProductList;
        }
    }
}
