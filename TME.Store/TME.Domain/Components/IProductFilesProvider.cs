using System;
using System.Collections.Generic;
using System.Text;
using TME.Domain.Models;

namespace TME.Domain.Components
{
    public interface IProductFilesProvider
    {
        List<ProductFiles> GetProductsFiles(List<string> SymbolList);
    }
}
