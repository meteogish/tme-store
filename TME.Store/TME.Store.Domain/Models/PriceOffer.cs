using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Domain.Models
{
    public class PriceOffer
    {
        public int AmmountInOffer { get; set; }
        public float Price { get; set; }
        public bool IsSpecialPrice { get; set; }

        public PriceOffer(int Ammount, float PriceValue, bool Special)
        {
            AmmountInOffer = Ammount;
            Price = PriceValue;
            IsSpecialPrice = Special;
        }
    }
}
