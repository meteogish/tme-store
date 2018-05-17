using Autofac;
using TME.Api.Contracts;
using TME.Api.Domain.Components;

namespace TME.Store.Registrations.Modules
{
    public class ApiModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            base.Load(builder);

            builder.RegisterType<ServiceBase>()
              .As<IRequestService>()
              .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
                .As<IApiSymbolsProvider>()
                .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
                .As<IApiCategoriesProvider>()
                .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
                .As<IApiSearchService>()
                .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
               .As<IApiStocksProvider>()
               .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
               .As<IApiProductsProvider>()
               .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
               .As<IApiPricesProvider>()
               .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
             .As<IApiProductFilesProvider>()
             .SingleInstance();

            builder.RegisterType<ProductsWrapper>()
             .As<IApiProductPricesAndStocksProvider>()
             .SingleInstance();
        }
    }
}
