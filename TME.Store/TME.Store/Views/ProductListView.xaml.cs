using Autofac;
using System.Threading.Tasks;
using TME.Store.Domain.Models;
using TME.Store.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ProductListView : ContentView
	{
        private ProductListViewModel _productsListViewModel;
        
        public ProductListView ()
		{
			InitializeComponent ();
            _productsListViewModel = App.Container.Resolve<ProductListViewModel>();
            BindingContext = _productsListViewModel;
        }

        public async Task Search(string searchText)
        {
            await _productsListViewModel.Search(searchText, 1);
        }

        public void OnItemAppearing(object sender, ItemVisibilityEventArgs e)
        {
            Product productAppeared = (e.Item as Product);
            _productsListViewModel.OnItemAppearing(productAppeared);
        }
    }
}