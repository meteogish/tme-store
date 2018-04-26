using System;
using System.Collections.Generic;
using System.Text;
using TME.Domain.Models;
namespace TME.Domain.Components
{
   public  interface ISearchService

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

        List<SearchResult> Search(string searchPlain);
    }
}
