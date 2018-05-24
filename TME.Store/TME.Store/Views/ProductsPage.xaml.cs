using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TME.Store.Domain.Components;
using TME.Store.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ProductsPage : ContentPage
	{
		public ProductsPage (List<String> symbols)
		{
			InitializeComponent ();
            ProductsViewModel productsViewModel = new ProductsViewModel(App.Container.Resolve<IProductsProvider>(), App.Current.MainPage.Navigation);
            BindingContext = productsViewModel;
            productsViewModel.LoadProducts(symbols);
        }
	}
}