using System.Collections.Generic;
using TME.Api.Domain.Models;

namespace TME.Api.Domain.Components
{
    public interface IApiSearchService

    {
        //Search Search(
        //    string country,
        //    string language,
        //    string SearchPlain,
        //    string SearchCategory,
        //    int SearchPage,
        //    bool SearchWithStock,
        //    string[][] SearchParameter,//o to aray of arays, czy to to
        //    string SearchOrder,
        //    string SearchOrderType
        //    );

        List<ApiSearchResult> Search(string searchPlain);
    }
}