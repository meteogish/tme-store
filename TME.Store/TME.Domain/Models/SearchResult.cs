using System.Collections.Generic;

namespace TME.Domain.Models
{
    public class SearchResult
    {
        public List<Product> Product { get; private set; }

        public SearchResult(List<Product> Product)
        {
            this.Product = Product;
        }
    }
}
