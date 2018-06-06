using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;
using System.Linq;

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
            products = new ObservableCollection<Product>();
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

        private string _lastSearchedText;
        private int page = 1;
        private int? maxPage = null;

        internal async void OnItemAppearing(Product productAppeared)
        {
            if(productAppeared.Symbol == Products.Last().Symbol)
            {                
                if(!maxPage.HasValue)
                {
                    throw new ArgumentException("MaxPage nie jest ustawiony");
                }

                if (++page != maxPage)
                {
                    await Search(_lastSearchedText, page);
                }
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

        public async Task Search(string searchText, int page)
        {
            IsBusy = true;
            _lastSearchedText = searchText;
            
            await Task.Run(() =>
            {
                SearchProductsResult searchResult = _productsProvider.Search(_lastSearchedText, page);
                foreach (Product prod in searchResult.Products)
                {
                    Products.Add(prod);
                }

                if(page == 1)
                {
                    maxPage = searchResult.PageCount;
                }
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
