using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiSymbolsProvider
    {
        List<string> GetSymbols(string categoryId);
    }
}
