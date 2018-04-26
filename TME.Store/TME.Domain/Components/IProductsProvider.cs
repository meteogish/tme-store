using System.Collections.Generic;
using TME.Domain.Models;
namespace TME.Domain.Components
{
   public interface IProductsProvider
    {
        List<Product> GetProducts(List<string> SymbolList);
    }
}
