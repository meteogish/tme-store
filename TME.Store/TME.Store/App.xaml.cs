using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TME.Store.Registrations;
using TME.Store.Views;
using Xamarin.Forms;

namespace TME.Store
{
	public partial class App : Application
	{
        public static IContainer Container { get; private set; }

		public App (ContainerBuilder builder)
		{
			InitializeComponent();
            BuildContainer(builder);

            NavigationPage navigationPage = new NavigationPage();
            MainPage = navigationPage;
            ProductsPage root = new Views.ProductsPage("2W08G-E4/51" );
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

        private void BuildContainer(ContainerBuilder builder)
        {
            builder.RegisterModule<ViewModelsModule>();
            Container = builder.Build();
        }
	}
}
