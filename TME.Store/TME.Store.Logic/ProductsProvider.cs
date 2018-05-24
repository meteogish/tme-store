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
        private IApiStocksProvider _apiStocksProvider;

        public ProductsProvider(IApiProductsProvider apiProductsProvider,
                                IApiPricesProvider apiPricesProvider,
                                IApiStocksProvider apiStocksProvider)
        {
            _apiProductsProvider = apiProductsProvider;
            _apiPricesProvider = apiPricesProvider;
            _apiStocksProvider = apiStocksProvider;
        }

        public ProductsResult GetProducts(List<string> symbols)
        {
            List<ApiProduct> apiProducts = _apiProductsProvider.GetProducts(symbols);
            ApiPriceResult<ApiProductPrice> priceResult = _apiPricesProvider.GetPrices(symbols);
            List<ApiStock> apiStockResult = _apiStocksProvider.GetStocks(symbols);

            List<Product> products = (from apiProduct in apiProducts
                                      join apiProductPrice in priceResult.ProductList on apiProduct.Symbol equals apiProductPrice.Symbol
                                      join apiStock in apiStockResult on apiProduct.Symbol equals apiStock.Symbol
                                      select new Product(
                                                apiProduct.Symbol,
                                                apiProduct.Producer,
                                                apiProduct.Description,
                                                apiProduct.Category,
                                                apiProduct.Unit,
                                                apiProduct.Photo,
                                                apiProduct.Thumbnail,
                                                
                                                apiStock.Amount,
                                                 new ProductPrice(
                                                    apiProductPrice.VatRate,
                                                    apiProductPrice.VatType,
                                                    apiProductPrice.PriceList.Select(p =>
                                                                        new PriceOffer(
                                                                        p.Ammount,
                                                                        p.PriceValue,
                                                                        p.Special)).ToList())))
                                                .ToList();


            return new ProductsResult(priceResult.PriceType, priceResult.Currency,products);
        }
    }
}
