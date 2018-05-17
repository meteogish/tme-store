using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Api.Models;

namespace TME.Store.Api.Components
{
    public interface IApiProductFilesProvider
    {
        List<ApiProductFiles> GetProductsFiles(List<string> SymbolList);
    }
}
