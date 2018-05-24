using System;
using System.Collections.Generic;

namespace TME.Api.Domain.Models
{
    public class ApiSearchResult
    {
        public List<ApiSearchProduct> ProductList { get; private set; }
        public int Ammount { get; private set; }
        public int PageNumber { get; private set; }
        public Dictionary<string,int> CategoryList { get; private set; }


        public ApiSearchResult(List<ApiSearchProduct> ProductList)
        {
            this.ProductList = ProductList;
        }


    }
}
