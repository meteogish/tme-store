using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;
using TME.Store.Views;
using Xamarin.Forms;

namespace TME.Store.ViewModels
{
    public class ProductsViewModel : INotifyPropertyChanged
    {

        private ObservableCollection<Product> products;
        private string currency;
        private IProductsProvider _productsProvider;

        public event PropertyChangedEventHandler PropertyChanged;

        private bool isBusy=false;

        public bool IsBusy { 
        
        set {
                OnPropertyChanged();
                isBusy = value;
        }
         
        
        get   { return isBusy; }
        
        }

        public ICommand MyCommand { private set; get; }

        public ObservableCollection<Product> Items
        {
            get { return products; }
            set
            {
                products = value;
                OnPropertyChanged();
            }
        }


        public String Currency
        {
            get { return currency; }
            set
            {
                currency = value;
                OnPropertyChanged();
            }
        }



        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }

        /*public void LoadProducts(List<string> symbols)
        {
            Items = new ObservableCollection<Product>(_productsProvider.GetProducts(symbols));
        }*/


        public async void LoadProducts(List<string> symbols)
        {
           this.IsBusy = true;

            await Task.Run(() =>
            {
                ProductsResult productsResult = _productsProvider.GetProducts(symbols);
                Items = new ObservableCollection<Product>(productsResult.Products);
                Currency = productsResult.Currency;

            });

            this.IsBusy = false;
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
