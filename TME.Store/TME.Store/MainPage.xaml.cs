using System;
using System.Collections.Generic;
using System.Diagnostics;
using TME.Domain.Models;
using TME.Store.Views;
using Xamarin.Forms;
using TME.Domain.Components;
using Autofac;

namespace TME.Store
{
    public partial class MainPage : ContentPage
    {
        private IStocksProvider _stocksProvider;
        private ICategoriesProvider _categoriesProvider;
        private ISearchService _searchService;
        private IProductsProvider _productsProvider;
        private IPricesProvider _priceProvider;
        private IProductFilesProvider _productFilesProvider;
        public MainPage()
        {
            InitializeComponent();
            BindingContext = this;
            _stocksProvider = App.Container.Resolve<IStocksProvider>();
            _categoriesProvider = App.Container.Resolve<ICategoriesProvider>();
            _productsProvider = App.Container.Resolve<IProductsProvider>();
            _priceProvider = App.Container.Resolve<IPricesProvider>();
            _productFilesProvider = App.Container.Resolve<IProductFilesProvider>();
            GetStocks();
            GetCategories();
            GetProducts();
            GetPrices();
            GetProductsFiles();
        }

        private void GetProducts()
        {
            try
            {
                List<Product> products = _productsProvider.GetProducts(new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51" });
            }
            catch
            {

            }
        }

        private void GetStocks()
        {
            try
            {
                ProductsListView.ItemsSource = _stocksProvider.GetStocks(new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51" });
            }
            catch (Exception e)
            {
                Debug.WriteLine(e);
            }

        }

        private void GetCategories()
        {
            try
            {
                Category cos = _categoriesProvider.GetCategoriesTree(-1, true);
            }
            catch (Exception e)
            {
                Debug.WriteLine(e);
            }

        }

        private void GetPrices()
        {
            try
            {
                PriceResult cos = _priceProvider.GetPrices("PLN", new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51" });
            }
            catch (Exception e)
            {
                Debug.WriteLine(e);
            }

        }
        private void GetProductsFiles()
        {
            try
            {
               List<ProductFiles> cos = _productFilesProvider.GetProductsFiles(new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51" });
            }
            catch (Exception e)
            {
                Debug.WriteLine(e);
            }

        }

        private void Search(string secret, string token)
        {
            try
            {
                //pelna wersja
                // ProductsListView.ItemsSource = _searchService.Search("PL", "EN", "1N4007", "113119", 1, false, "ACCURACY", "ASC");
                //ProductsListView.ItemsSource = _searchService.Search("1N4007");

            }
            catch (Exception e)
            {
                Debug.WriteLine(e);
            }
        }
    }
}