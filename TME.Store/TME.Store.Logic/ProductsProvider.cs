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

        public ProductsResult GetProducts(List<string> symbols)
        {
            List<ApiProduct> apiProducts = _apiProductsProvider.GetProducts(symbols);

            ApiPriceResult<ApiProductPriceAndStock> pricesAndStockResult = _apiPricesAndStocksProvider.GetPricesAndStocks(symbols);

            List<Product> products = (from apiProduct in apiProducts
                                      join apiProductPriceAndStock in pricesAndStockResult.ProductList on apiProduct.Symbol equals apiProductPriceAndStock.Symbol
                                      select new Product(
                                                apiProduct.Symbol,
                                                apiProduct.Producer,
                                                apiProduct.Description,
                                                apiProduct.Category,
                                                apiProduct.Unit,
                                                apiProduct.Photo,
                                                apiProduct.Thumbnail,
                                                apiProductPriceAndStock.Amount,
                                                pricesAndStockResult.Currency,
                                                 new ProductPrice(
                                                    apiProductPriceAndStock.VatRate,
                                                    apiProductPriceAndStock.VatType,
                                                    apiProductPriceAndStock.PriceList.Select(p =>
                                                                        new PriceOffer(
                                                                        p.Amount,
                                                                        p.PriceValue,
                                                                        p.Special)).ToList())))
                                                .ToList();


            return new ProductsResult(pricesAndStockResult.PriceType, pricesAndStockResult.Currency, products);
        }

        public SearchProductsResult Search(string symbol, int page)
        {
            try
            {

                ApiSearchResult apiSearchResult = _apiSearchService.Search(symbol, page);
                List<String> listOfSymbols = apiSearchResult.ProductList.Select(s => s.Symbol).ToList();

                ApiPriceResult<ApiProductPriceAndStock> pricesAndStockResultFirstHalf = _apiPricesAndStocksProvider.GetPricesAndStocks(listOfSymbols.Take(10).ToList());
                ApiPriceResult<ApiProductPriceAndStock> pricesAndStockResultSecondHalf = _apiPricesAndStocksProvider.GetPricesAndStocks(listOfSymbols.Skip(10).Take(10).ToList());

                List<Product> products = (from apiProduct in apiSearchResult.ProductList
                                          join apiProductPriceAndStock in pricesAndStockResultFirstHalf.ProductList.Concat(pricesAndStockResultSecondHalf.ProductList) on apiProduct.Symbol equals apiProductPriceAndStock.Symbol
                                          select new Product(
                                                    apiProduct.Symbol,
                                                    apiProduct.Producer,
                                                    apiProduct.Description,
                                                    apiProduct.Category,
                                                    apiProduct.Unit,
                                                    apiProduct.Photo,
                                                    apiProduct.Thumbnail,
                                                    apiProductPriceAndStock.Amount,
                                                    pricesAndStockResultFirstHalf.Currency,
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

                return new SearchProductsResult(pricesAndStockResultFirstHalf.PriceType,
                                                pricesAndStockResultFirstHalf.Currency,
                                                products,
                                                pageCount);
            }
            catch (Exception ex)
            {
                string mes = ex.Message;
            }
            return null;
        }
    }
}
