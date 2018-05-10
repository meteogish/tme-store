using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;
using System.Windows.Input;
using TME.Domain.Components;
using TME.Domain.Models;
using TME.Store.Views;
using Xamarin.Forms;

namespace TME.Store.ViewModels
{
    public class ProductsViewModel
    {

        private ObservableCollection<Product> products;
        private IProductsProvider _productsProvider;

        public ICommand MyCommand { private set; get; }

        public ObservableCollection<Product> Items
        {
            get { return products; }
            set
            {

                products = value;
            }
        }
        public void LoadProducts(List<string> symbols)
        {
            Items = new ObservableCollection<Product>(_productsProvider.GetProducts(symbols));
        }

        public ProductsViewModel(IProductsProvider productsProvider, INavigation navigation)
        {
            _productsProvider = productsProvider;
            MyCommand = new Command(
           execute: () =>
           {
               navigation.PushAsync(new ProductsPage(new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51", "BAT-123/EG-B2", "BAT-23A/DR-B2" }));
           });
        }
    }
}
