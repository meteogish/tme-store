using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiCategoriesProvider
    {
        ApiCategory GetCategoriesTree(int CategoryId, bool Tree);
    }
}
