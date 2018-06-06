using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TME.Store.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class SearchProductsPage : ContentPage
	{
        private SearchProductsPageViewModel _productsPageViewModel = App.Container.Resolve<SearchProductsPageViewModel>();
        //private ProductListViewModel _productsListViewModel = App.Container.Resolve<ProductListViewModel>();

        public SearchProductsPage (string searchText)
		{
			InitializeComponent ();
            BindingContext = _productsPageViewModel;
            Task.Run(() => ProductListView.Search(searchText));
        }
    }
}