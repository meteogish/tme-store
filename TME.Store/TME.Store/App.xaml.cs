using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TME.Api.Domain.Components;
using TME.Store.Registrations;
using TME.Store.ViewModels;
using TME.Store.Views;
using Xamarin.Forms;

namespace TME.Store
{
	public partial class App : Application
    {
        private static ViewModels.Locator _locator;
        public static ViewModels.Locator Locator => _locator ?? (_locator = new ViewModels.Locator());

        public INavigation navi;
		public App ()
		{
			InitializeComponent();

            NavigationPage navigationPage = new NavigationPage();
            MainPage = navigationPage;
            SearchProductsPage root = new SearchProductsPage("diody");
            navigationPage.PushAsync(root).Wait();
        }

        protected override void OnStart ()
		{
			// Handle when your app starts
		}

		protected override void OnSleep ()
		{
			// Handle when your app sleeps
		}

		protected override void OnResume ()
		{
			// Handle when your app resumes
		}
	}
}
