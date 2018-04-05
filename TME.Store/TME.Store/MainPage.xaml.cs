using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using tmeapiwrapper;
using tmeapiwrapper.Data;
using tmeapiwrapper.net.Data;
using Xamarin.Forms;

namespace TME.Store
{
	public partial class MainPage : ContentPage
	{
		public MainPage(string secret, string token)
		{
			InitializeComponent();
		    BindingContext = this;
            GetStocks(secret, token);
            GetCategories(secret, token);
		}

	    private void GetStocks(string secret, string token)
	    {
	        try
	        {
                ProductsWrapper test = new ProductsWrapper(secret, token);

	            RootObjectResponse rootResponse = test.GetStocks("PL", "EN", new List<string>() { "1WAT-LED-LIGHT", "3CHAZ-LO", "2W08G-E4/51" });

	            string s = rootResponse.Data.ToString();
	            var castTest = JsonConvert.DeserializeObject<ProductGetStocksResponseData>(s);
	            ProductsListView.ItemsSource = castTest.ProductList;
	        }
	        catch (Exception e)
	        {
	            Debug.WriteLine(e);
	        }

	    }

        private void GetCategories(string secret, string token)
        {
            try
            {
                ProductsWrapper test = new ProductsWrapper(secret, token);

                RootObjectResponse rootResponse = test.GetCategories("PL", "EN", -1, true);

                string s = rootResponse.Data.ToString();
                var castTest = JsonConvert.DeserializeObject<ProductGetCategoriesResponseData>(s);
            }
            catch (Exception e)
            {
                Debug.WriteLine(e);
            }

        }
    }
}
