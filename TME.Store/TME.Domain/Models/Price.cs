using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Domain.Models
{
    public class Price
    {
        public int Ammount { get; set; }
        public float PriceValue { get; set; }
        public bool Special { get; set; }

        public Price(int Ammount, float PriceValue, bool Special)
        {
            this.Ammount = Ammount;
            this.PriceValue = PriceValue;
            this.Special = Special;
        }


    }
}
