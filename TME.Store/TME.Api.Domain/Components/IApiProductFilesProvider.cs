using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiProductFilesProvider
    {
        List<ApiProductFiles> GetProductsFiles(List<string> SymbolList);
    }
}
