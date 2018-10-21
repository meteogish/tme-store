using Autofac;
using System;
using System.Collections.Generic;
using System.Text;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;
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

            builder.RegisterType<SearchProductsResultEnumerator>()
                .As<IEnumerator<SearchProductsResult>>();

            builder.Register<Func<string, IEnumerator<SearchProductsResult>>>(ctx =>
            {
                IComponentContext context = ctx.Resolve<IComponentContext>();
                return (searchText) =>
                {
                    return context.Resolve<IEnumerator<SearchProductsResult>>(new TypedParameter(typeof(string), searchText));
                };
            });
        }
    }
}
