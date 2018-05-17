using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Api.Models
{
   public  class ApiProductFiles
    {
        public  string Symbol { get; private set; }
        public ApiFile Files { get; private set; }
        public ApiProductFiles(string Symbol,ApiFile Files)
        {
            this.Symbol = Symbol;
            this.Files = Files;
        }
    }
}
