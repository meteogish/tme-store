using System.Windows.Input;
using TME.Store.Views;
using Xamarin.Forms;

namespace TME.Store.ViewModels
{
    public class SearchProductsPageViewModel
    {
        private ICommand searchCommand;
        private readonly INavigation _navigation;

        public ICommand SearchCommand
        {
            get { return searchCommand; }
            set { searchCommand = value; }
        }
        
        public SearchProductsPageViewModel(INavigation navigation)
        {

            _navigation = navigation;
            SearchCommand = new Command<string>((text) =>
            {
                _navigation.PushAsync(new SearchProductsPage(text));
            });
        }

    }
}
