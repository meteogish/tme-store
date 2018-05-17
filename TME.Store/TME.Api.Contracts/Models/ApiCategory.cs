using System.Collections.Generic;

namespace TME.Store.Api.Models
{
    public class ApiCategory
    {
        public string Id { get; private set; }
        public string ParentId { get; private set; }
        public int Depth { get; private set; }
        public string Name { get; private set; }
        public int TotalProducts { get; private set; }
        public int SubTreeCount { get; private set; }
        public string Thumbnail { get; private set; }
        public List<ApiCategory> SubTree { get; private set; }

        public ApiCategory(string Id, string ParentId, int Depth, string Name, int TotalProducts, int SubTreeCount, string Thumbnail, List<ApiCategory> SubTree)
        {
            this.Id = Id;
            this.ParentId = ParentId;
            this.Depth = Depth;
            this.Name = Name;
            this.TotalProducts = TotalProducts;
            this.SubTreeCount = SubTreeCount;
            this.Thumbnail = Thumbnail;
            this.SubTree = SubTree;
        }
    }
}
