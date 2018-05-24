using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using TME.Api.Domain.Components;
using TME.Api.Domain.Models;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;

namespace TME.Store.Logic
{
    public class SearchService : ISearchService
    {
        private IApiSearchService _apiSearchService;
        private IApiPricesProvider _apiPricesProvider;
        private IApiStocksProvider _apiStocksProvider;

        public SearchService(IApiSearchService apiSearchService,
                                IApiPricesProvider apiPricesProvider,
                                    IApiStocksProvider apiStocksProvider)
        {
            _apiSearchService = apiSearchService;
            _apiPricesProvider = apiPricesProvider;
            _apiStocksProvider = apiStocksProvider;
        }

        public ProductsResult GetSearchedProducts(string symbol)
        {
            List<ApiSearchProduct> apiProducts = _apiSearchService.Search(symbol).ProductList;
            List<String> listOfSymbols = apiProducts.Select(s => s.Symbol).ToList();
            List<ApiStock> apiStockResult = _apiStocksProvider.GetStocks(listOfSymbols.Skip(10).Take(10).ToList());

            ApiPriceResult<ApiProductPrice> priceResult = _apiPricesProvider.GetPrices(listOfSymbols.Skip(10).Take(10).ToList());

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

            return new ProductsResult(priceResult.PriceType, priceResult.Currency, products);
        }
    }
}
