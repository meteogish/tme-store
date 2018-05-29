using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Store.Domain.Models
{
    public class Product
    {
        public string Symbol { get; private set; }
        public string Producer { get; private set; }
        public string Description { get; private set; }
        public string Category { get; private set; }
        public string Unit { get; private set; }
        public string Photo { get; private set; }
        public string Thumbnail { get; private set; }
        public int Amount { get; private set; }     
        public ProductPrice ProductPrice { get; }

        public Product(string symbol,
                        string producer,
                        string description,
                        string category,
                        string unit,
                        string thumbnail,
                        string photo,
                        int amount,
                        ProductPrice price
                       )
        {
            Symbol = symbol;
            Producer = producer;
            Description = description;
            Category = category;
            Unit = unit;
            ProductPrice = price;
            Photo = "https:" + photo;
            Thumbnail = "https:" + thumbnail;
            Amount = amount;
        }
    }
}
