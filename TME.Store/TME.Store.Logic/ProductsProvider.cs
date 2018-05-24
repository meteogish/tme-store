using System.Collections.Generic;
using System.Linq;
using TME.Api.Domain.Components;
using TME.Api.Domain.Models;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;

namespace TME.Store.Logic
{
    public class ProductsProvider : IProductsProvider
    {
        private IApiProductsProvider _apiProductsProvider;
        private IApiPricesProvider _apiPricesProvider;

        public ProductsProvider(IApiProductsProvider apiProductsProvider,
                                IApiPricesProvider apiPricesProvider)
        {
            _apiProductsProvider = apiProductsProvider;
            _apiPricesProvider = apiPricesProvider;
        }

        public ProductsResult GetProducts(List<string> symbols)
        {
            List<ApiProduct> apiProducts = _apiProductsProvider.GetProducts(symbols);
            ApiPriceResult<ApiProductPrice> priceResult = _apiPricesProvider.GetPrices(symbols);



            List<Product> products = apiProducts
                .Join<ApiProduct, ApiProductPrice, string, Product>(
                        priceResult.ProductList,
                        prod => prod.Symbol,
                        prodPrice => prodPrice.Symbol,
                        (apiProd, apiProdPrice) =>
                            new Product(
                                apiProd.Symbol,
                                apiProd.Producer,
                                apiProd.Description,
                                apiProd.Category,
                                apiProd.Unit,
                                apiProd.Photo,
                                apiProd.Thumbnail,
                                new ProductPrice(
                                    apiProdPrice.VatRate,
                                    apiProdPrice.VatType,
                                    apiProdPrice.PriceList
                                                .Select(p =>
                                                        new PriceOffer(
                                                        p.Ammount,
                                                        p.PriceValue,
                                                        p.Special)).ToList()))
                        ).ToList();

            return new ProductsResult(priceResult.PriceType, priceResult.Currency, products);
        }
    }
}
