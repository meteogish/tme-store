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

        public SearchService(IApiSearchService apiSearchService,
                                IApiPricesProvider apiPricesProvider)
        {
            _apiSearchService = apiSearchService;
            _apiPricesProvider = apiPricesProvider;
        }

        public ProductsResult GetSearchedProducts(string symbol)
        {
            List<ApiSearchProduct> apiProducts = _apiSearchService.Search(symbol).ProductList;
            List<String> listOfSymbols = apiProducts.Select(s => s.Symbol).ToList();


            ApiPriceResult priceResult = _apiPricesProvider.GetPrices(listOfSymbols);

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
