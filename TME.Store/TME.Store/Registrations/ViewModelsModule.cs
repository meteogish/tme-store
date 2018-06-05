using Autofac;
using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.ViewModels;
using Xamarin.Forms;

namespace TME.Store.Registrations
{
    public class ViewModelsModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            base.Load(builder);
            //Register all ViewModels here
            builder.RegisterType<ProductListViewModel>();
            builder.RegisterType<SearchProductsPageViewModel>();
            builder.Register(ctx =>
                {
                    return Application.Current.MainPage.Navigation;
                }
            ).As<INavigation>();
        }
    }
}
