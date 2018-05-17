using TME.Store.Api.Models;

namespace TME.Store.Api.Components
{
    public interface IApiCategoriesProvider
    {
        ApiCategory GetCategoriesTree(int CategoryId, bool Tree);
    }
}
