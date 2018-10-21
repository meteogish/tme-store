using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using TME.Store.Domain.Models;

namespace TME.Store.ViewModels
{
    public class ProductListViewModel : ViewModelBase
    {
        private IEnumerator<SearchProductsResult> _searchEnumerator;
        private string currency;
        private string errorMessage;
        private bool isBusy = false;
        private ObservableCollection<Product> products;

        public ProductListViewModel(Func<string, IEnumerator<SearchProductsResult>> searchEnumeratorFactory)
        {
            GetSearchEnumerator = searchEnumeratorFactory;
            products = new ObservableCollection<Product>();
        }

        public string Currency
        {
            get
            {
                return currency;
            }
            set
            {
                currency = value;
                RaisePropertyChanged();
            }
        }

        public string ErrorMessage
        {
            get { return errorMessage; }
            set
            {
                errorMessage = value;
                RaisePropertyChanged();
            }
        }

        public bool IsBusy
        {
            set
            {
                isBusy = value;
                RaisePropertyChanged();
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
                RaisePropertyChanged();
            }
        }

        protected Func<string, IEnumerator<SearchProductsResult>> GetSearchEnumerator { get; private set; }

        public void Search(string searchText)
        {
            _searchEnumerator = GetSearchEnumerator(searchText.Trim().Replace(" ", "-"));
            Currency = null;
            FetchNextPage();
        }
        internal async void OnItemAppearing(Product productAppeared)
        {
            if (productAppeared.Symbol == Products.Last().Symbol)
            {
                await Task.Run(FetchNextPage).ConfigureAwait(false);
            }
        }

        private async Task FetchNextPage()
        {
            try
            {
                IsBusy = true;
                if (_searchEnumerator.MoveNext())
                {
                    if (Currency == null)
                    {
                        Currency = _searchEnumerator.Current.Currency;
                    }

                    foreach (Product prod in _searchEnumerator.Current.Products)
                    {
                        Products.Add(prod);
                    }
                }
            }
            catch (ApplicationException ex)
            {
                ErrorMessage = ex.Message;
            }
            IsBusy = false;
        }
    }
}