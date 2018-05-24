using Autofac;
using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Domain.Components;
using TME.Store.Logic;

namespace TME.Store.Registrations.Modules
{
    class StoreLogicModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            base.Load(builder);
            builder.RegisterType<ProductsProvider>()
                .As<IProductsProvider>();

            builder.RegisterType<SearchService>()
                .As<ISearchService>();
        }
    }
}   
