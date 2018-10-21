using System;
using System.Collections.Generic;
using System.Text;
using Autofac;
using GalaSoft.MvvmLight;
using TME.Api.Domain.Components;
using TME.Store.Registrations;
using Xamarin.Forms;

namespace TME.Store.ViewModels
{
    public class Locator
    {
        public Locator()
        {
            BuildContainer();
        }

        protected IContainer Container { get; private set; }

        private void BuildContainer()
        {
            ContainerBuilder builder = Factory.GetRegistrations();
            builder.RegisterType<ProductListViewModel>();
            builder.RegisterType<ProductDetailsViewModel>();

            if (ViewModelBase.IsInDesignModeStatic)
            {
            }
            else
            {
                IApiConfigurationProvider instance = DependencyService.Get<IApiConfigurationProvider>();
                builder.RegisterInstance(instance);
            }
            Container = builder.Build();
        }

        public ProductListViewModel ProductListViewModel => Container.Resolve<ProductListViewModel>();
        public ProductDetailsViewModel ProductDetailsViewModel => Container.Resolve<ProductDetailsViewModel>();
    }
}
