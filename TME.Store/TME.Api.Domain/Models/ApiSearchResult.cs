using System.Collections.Generic;

namespace TME.Api.Domain.Models
{
    public class ApiSearchResult
    {
        public List<ApiProduct> Product { get; private set; }

        public ApiSearchResult(List<ApiProduct> Product)
        {
            this.Product = Product;
        }
    }
}
