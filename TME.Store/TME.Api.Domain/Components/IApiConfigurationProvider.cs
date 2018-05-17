using TME.Api.Domain.Models;

namespace TME.Domain.Components
{
    public interface IApiConfigurationProvider
    {
        ApiConfiguration ApiConfiguration { get; }
    }
}
