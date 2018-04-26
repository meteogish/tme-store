using Autofac;
using System;
using System.Collections.Generic;
using System.Text;
using TME.Domain.Components;
using TME.Store.Api;

namespace TME.Store.Registrations.Modules
{
    public class ApiModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            base.Load(builder);

            builder.RegisterType<ProductsWrapper>()
                .As<ICategoriesProvider>()
                .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
                .As<ISearchService>()
                .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
               .As<IStocksProvider>()
               .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
               .As<IProductsProvider>()
               .SingleInstance();


            builder.RegisterType<ProductsWrapper>()
               .As<IPricesProvider>()
               .SingleInstance();
            builder.RegisterType<ProductsWrapper>()
             .As<IProductFilesProvider>()
             .SingleInstance();
        }
    }
}
