using System;
using System.Threading.Tasks;
using TME.Store.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class SearchProductsPage : ContentPage
	{
        private string _initialSearchText = null;

        public SearchProductsPage (string searchText)
		{
			InitializeComponent ();
            _initialSearchText = searchText;
            SearchBar.Text = _initialSearchText;

            (ProductListView.BindingContext as ProductListViewModel).Search(searchText);
        }

        private void SearchBar_SearchButtonPressed(object sender, EventArgs e)
        {
            if(sender is SearchBar searchBar)
            {
                string searchedText = searchBar.Text;
                searchBar.Text = _initialSearchText;
                Navigation.PushAsync(new SearchProductsPage(searchedText));
            }
        }
    }
}