using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TME.Store.Domain.Models;
using TME.Store.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ProductDetailsView : ContentPage
	{
        private ProductDetailsViewModel _productsDetailsViewModel = App.Locator.ProductDetailsViewModel;

        public ProductDetailsView (Product item)
		{

            InitializeComponent();
            _productsDetailsViewModel.SetProductDetails(item);
            BindingContext = _productsDetailsViewModel;
		}


	}
}