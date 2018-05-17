namespace TME.Store.Api.Models
{
    public class ApiProduct
    {
        public string Symbol { get; private set; }
        public string OriginalSymbol { get; private set; }
        public string Producer { get; private set; }
        public string Description { get; private set; }
        public int OfferId { get; private set; }
        public string CategoryId { get; private set; }
        public string Category { get; private set; }
        public string Photo { get; private set; }
        public Uri Thumbnail { get; private set; }
        public float Weight { get; private set; }
        public int SuppliedAmount { get; private set; }
        public int MinAmount { get; private set; }
        public int Multiples { get; private set; }
        public string Unit { get; private set; }
        public string ProductInformationPage { get; private set; }
        public ApiGuarantee Guarantee { get; private set; }
        public string[] ProductStatusList { get; private set; }

        public ApiProduct(
                         string Symbol,
                         string OriginalSymbol,
                         string Producer,
                         string Description,
                         int OfferId,
                         string CategoryId,
                         string Category,
                         string Photo,
                         string Thumbnail,
                         float Weight,
                         int SuppliedAmount,
                         int MinAmount,
                         int Multiples,
                         string Unit,
                         string ProductInformationPage,
                         ApiGuarantee Guarantee,
                         string[] ProductStatusList
                       )
        {
            this.Symbol = Symbol;
            this.OriginalSymbol = OriginalSymbol;
            this.Producer = Producer;
            this.Description = Description;
            this.OfferId = OfferId;
            this.CategoryId = CategoryId;
            this.Category = Category;
            this.Photo = Photo;
            this.Thumbnail = new Uri("https:"+Thumbnail);
            this.Weight = Weight;
            this.SuppliedAmount = SuppliedAmount;
            this.MinAmount = MinAmount;
            this.Multiples = Multiples;
            this.Unit = Unit;
            this.ProductInformationPage = ProductInformationPage;
            this.Guarantee = Guarantee;
            this.ProductStatusList = ProductStatusList;
        }
    }
}
