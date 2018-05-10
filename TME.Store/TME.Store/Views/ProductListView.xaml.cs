using Autofac;
using TME.Store.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ProductListView : ContentView
	{
		public ProductListView ()
		{
			InitializeComponent ();
            BindingContext = App.Container.Resolve<ProductsViewModel>();
        }
	}
}