using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;
using TME.Domain.Components;
using TME.Domain.Models;

namespace TME.Store.ViewModels
{
    public class ProductsViewModel
    {

        private ObservableCollection<Product> products;
        public ObservableCollection<Product> Items
        {
            get { return products; }
            set
            {

                products = value;
            }
        }

        public ProductsViewModel(IProductsProvider productsProvider)
        {
            Items = new ObservableCollection<Product>(productsProvider.GetProducts(new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51", "BAT-123/EG-B2", "BAT-23A/DR-B2" }));
        }
    }
}
