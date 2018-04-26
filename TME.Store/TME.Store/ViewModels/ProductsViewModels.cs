using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;
using TME.Domain.Components;
using TME.Domain.Models;

namespace TME.Store.ViewModels
{
    public class ProductsViewModels  
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

      

        public ProductsViewModels(IProductsProvider productsProvider)
          {
            Items = new ObservableCollection<Product>(productsProvider.GetProducts(new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51" }));
            /*
            Items.Add(new ItemOfProducts
            {
                Category = "category",
                Description = "description1",
                Offerid = 10,
                Producer = "producer1",
                Symbol = "SN-12",
                thumbnail = "string",
                unit = ".szt"
            });


            Items.Add(new ItemOfProducts
            {
                Category = "category",
                Description = "description2",
                Offerid = 11,
                Producer = "producer",
                Symbol = "symbol",
                thumbnail = "2string",
                unit = ".szt"
            });


            Items.Add(new ItemOfProducts
            {
                Category = "lamps",
                Description = "description3",
                Offerid = 12,
                Producer = "producer",
                Symbol = "symbol",
                thumbnail = "2string",
                unit = ".szt"
            });*/

        }

        
    }


    public class ItemOfProducts{


        public string Symbol { set; get; }    //<- Unikatowy identyfikator produktu.
        public string Producer { set; get; }    //<- Nazwa producenta.
        public string Description { set; get; }  //<- - Opis produktu.
        public int Offerid { set; get; }     //<- Numer dostępnej oferty
        public string Category { set; get; }   //<- Nazwa ostatniego zagłębienia kategorii, w której znajduje się produkt.
        public string thumbnail { set; get; }       //<- - Adres URL do miniaturki zdjęcia produktu (100x75px).
        public string unit { set; get; }      //<- Symbol jednostki używanej w wyrażaniu ilości danego produktu np. "szt" (ilość sztuk).

    }
}
