﻿using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Api.Models
{
    public class ApiPrice
    {
        public int Ammount { get; set; }
        public float PriceValue { get; set; }
        public bool Special { get; set; }

        public ApiPrice(int Ammount, float PriceValue, bool Special)
        {
            this.Ammount = Ammount;
            this.PriceValue = PriceValue;
            this.Special = Special;
        }


    }
}

