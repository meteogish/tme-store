using TME.Store.Api.Models;
namespace TME.Store.Api.Components
{
    public interface IApiSymbolsProvider
    {
        ApiSymbols GetSymbols(string country, string language, string categoryId);
    }
}
