using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;

namespace TME.Store.ViewModels
{
    public class ProductListViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<Product> products;
        private IProductsProvider _productsProvider;
        public event PropertyChangedEventHandler PropertyChanged;
        private bool isBusy = false;

        public ProductListViewModel(IProductsProvider productsProvider)
        {
            _productsProvider = productsProvider;
        }

        public bool IsBusy
        {
            set
            {
                isBusy = value;
                OnPropertyChanged();
            }

            get
            {
                return isBusy;
            }
        }


        public ObservableCollection<Product> Products
        {
            get { return products; }
            set
            {
                products = value;
                OnPropertyChanged();
            }
        }

        public async Task Search(string searchText)
        {
            IsBusy = true;

            await Task.Run(() =>
            {
                ProductsResult productsResult = _productsProvider.Search(searchText);
                Products = new ObservableCollection<Product>(productsResult.Products);
            });

            IsBusy = false;
        }


        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
