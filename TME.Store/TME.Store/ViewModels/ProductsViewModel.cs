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

        private ICommand searchCommand;

        public ICommand SearchCommand {
            get { return searchCommand; }
            set { searchCommand = value;}
        }

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


        public async void LoadProducts(string symbols)
        {
           this.IsBusy = true;

            await Task.Run(() =>
            {
                ProductsResult productsResult = _productsProvider.Search(symbols);
                Items = new ObservableCollection<Product>(productsResult.Products);
                Currency = productsResult.Currency;

            });

            this.IsBusy = false;
        }

        public ProductsViewModel(IProductsProvider productsProvider, INavigation navigation)
        {
            _productsProvider = productsProvider;
            SearchCommand = new Command<string>((text) =>
            {
                navigation.PushAsync(new ProductsPage(text));
            });
            
        }
    }
}
