using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IRequestService
    {
        RootObjectResponse SendPostRequest(string url, List<KeyValuePair<string, string>> values);
    }
}