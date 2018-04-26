using TME.Domain.Models;

namespace TME.Domain.Components
{
    public interface ICategoriesProvider
    {
        Category GetCategoriesTree(int CategoryId, bool Tree);
    }
}
