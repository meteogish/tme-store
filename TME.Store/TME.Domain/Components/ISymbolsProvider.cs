using TME.Domain.Models;
namespace TME.Domain.Components
{
    public interface ISymbolsProvider
    {
        Symbols GetSymbols(string country, string language, string categoryId);
    }
}
