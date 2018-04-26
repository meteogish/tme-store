using System.Collections.Generic;

namespace TME.Domain.Models
{
    public class Category
    {
        public string Id { get; private set; }
        public string ParentId { get; private set; }
        public int Depth { get; private set; }
        public string Name { get; private set; }
        public int TotalProducts { get; private set; }
        public int SubTreeCount { get; private set; }
        public string Thumbnail { get; private set; }
        public List<Category> SubTree { get; private set; }

        public Category(string Id, string ParentId, int Depth, string Name, int TotalProducts, int SubTreeCount, string Thumbnail, List<Category> SubTree)
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
