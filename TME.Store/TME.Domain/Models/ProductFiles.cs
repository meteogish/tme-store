using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Domain.Models
{
   public  class ProductFiles
    {
        public  string Symbol { get; private set; }
        public File Files { get; private set; }
        public ProductFiles(string Symbol,File Files)
        {
            this.Symbol = Symbol;
            this.Files = Files;
        }
    }
}
