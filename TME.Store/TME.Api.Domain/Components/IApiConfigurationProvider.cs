using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiConfigurationProvider
    {
        ApiConfiguration ApiConfiguration { get; }
    }
}
