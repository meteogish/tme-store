using System;
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
        private IApiSearchService _apiSearchService;
        private IApiProductPricesAndStocksProvider _apiPricesAndStocksProvider;

        public ProductsProvider(IApiProductsProvider apiProductsProvider,
                                IApiProductPricesAndStocksProvider apiPricesAndStocksProvider,
                                IApiSearchService apiSearchService)
        {
            _apiProductsProvider = apiProductsProvider;
            _apiPricesAndStocksProvider = apiPricesAndStocksProvider;
            _apiSearchService = apiSearchService;
        }

        public SearchProductsResult Search(string searchText, int page)
        {
            ApiSearchResult apiSearchResult = _apiSearchService.Search(searchText, page);
            List<string> listOfSymbols = apiSearchResult.ProductList.Select(s => s.Symbol).ToList();

            ApiPriceResult<ApiProductPriceAndStock> productPrices = _apiPricesAndStocksProvider.GetPricesAndStocks(listOfSymbols);

            List<Product> products = (from apiProduct in apiSearchResult.ProductList
                                      join apiProductPriceAndStock in productPrices.ProductList on apiProduct.Symbol equals apiProductPriceAndStock.Symbol
                                      select new Product(
                                                apiProduct.Symbol,
                                                apiProduct.Producer,
                                                apiProduct.Description,
                                                apiProduct.Category,
                                                apiProduct.Unit,
                                                apiProduct.Photo,
                                                apiProduct.Thumbnail,
                                                apiProductPriceAndStock.Amount,
                                                 new ProductPrice(
                                                    apiProductPriceAndStock.VatRate,
                                                    apiProductPriceAndStock.VatType,
                                                    apiProductPriceAndStock.PriceList.Select(p =>
                                                                        new PriceOffer(
                                                                        p.Amount,
                                                                        p.PriceValue,
                                                                        p.Special)).ToList())))
                                                .ToList();

            int pageCount = (int)Math.Ceiling(apiSearchResult.Amount / 20.0);

            return new SearchProductsResult(productPrices.PriceType,
                                            productPrices.Currency,
                                            products,
                                            pageCount);
        }
    }
}
