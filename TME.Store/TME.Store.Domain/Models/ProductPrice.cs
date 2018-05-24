using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;

namespace TME.Store.Domain.Models
{
    public class ProductPrice
    {
        public int VatRate { get; private set; }
        public string VatType { get; private set; }
        public float MinPrice { get; private set; }
        public IReadOnlyCollection<PriceOffer> PriceOffers { get; private set; }

        public ProductPrice(int vatRate,
                            string vatType,
                            IList<PriceOffer> offers)
        {
            VatRate = vatRate;
            VatType = vatType;
            
            PriceOffers = new ReadOnlyCollection<PriceOffer>(offers);
            MinPrice = PriceOffers.Min(offer => offer.Price);
        }
    }
}
