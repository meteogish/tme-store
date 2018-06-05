using System;
using System.Collections.Generic;

namespace TME.Api.Domain.Models
{
    public class ApiSearchResult
    {
        public List<ApiSearchProduct> ProductList { get; set; }
        public int Amount { get; set; }
        public int PageNumber { get; set; }
        public Dictionary<string,int> CategoryList { get; set; }
    }
}
