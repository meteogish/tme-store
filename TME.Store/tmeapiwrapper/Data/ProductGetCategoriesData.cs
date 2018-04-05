using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tmeapiwrapper.Data
{
    public class ProductGetCategoriesData
    {
        public string Id { get; set; }
        public string ParentId { get; set; }
        public int Depth { get; set; }
        public string Name { get; set; }
        public int TotalProducts { get; set; }
        public int SubTreeCount { get; set; }
        public string Thumbnail { get; set; }
        public List<ProductGetCategoriesData> SubTree { get; set; }

    }
}
