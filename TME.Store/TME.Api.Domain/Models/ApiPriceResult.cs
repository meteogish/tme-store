using System.Collections.Generic;

namespace TME.Api.Domain.Models
{
    public class ApiPriceResult<T> where T : ApiProductPrice
    {
        public string Language { get; set; }
        public string Currency { get; set; }
        public string PriceType { get; set; }
         public List<T> ProductList{ get; set; }

        public ApiPriceResult(string Language,string Currency , string PriceType, List<T> ProductLis)
        {
            this.Language = Language;
            this.Currency = Currency;
            this.PriceType = PriceType;
            this.ProductList = ProductList;
        }
    }
}
