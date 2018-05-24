using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using TME.Api.Domain.Components;
using TME.Domain.Components;
using TME.Api.Domain.Models;

using TME.Api.Contracts.Logic;

namespace TME.Api.Contracts
{
    public class ProductsWrapper : IApiSymbolsProvider, IApiProductsProvider, IApiStocksProvider, IApiCategoriesProvider,
        IApiSearchService, IApiPricesProvider, IApiProductFilesProvider, IApiProductPricesAndStocksProvider
    {
        private const string Get_Stocks_Url = @"https://api.tme.eu/Products/GetStocks.json";
        private const string Get_Categories_Url = @"https://api.tme.eu/Products/GetCategories.json";
        private const string Get_Products_Url = @"https://api.tme.eu/Products/GetProducts.json";
        private const string Get_Symbols_Url = @"https://api.tme.eu/Products/GetSymbols.json";
        private const string Get_Prices_Url = @"https://api.tme.eu/Products/GetPrices.json";
        private const string Get_ProductFiles_Url = @"https://api.tme.eu/Products/GetProductsFiles.json";
        private const string Get_PricesAndStocks = @"https://api.tme.eu/Products/GetPricesAndStocks.json";
        private const string Get_SearchResult = @"https://api.tme.eu/Products/Search.json";

        private IRequestService _requestService;

        private ApiConfiguration _apiConfiguration;

        private string PrefixRequest(string url) => $"POST&{WebUtility.UrlEncode(@url)}&";

        public ProductsWrapper(IApiConfigurationProvider configurationProvider, IRequestService requestService)
        {
            _apiConfiguration = configurationProvider.ApiConfiguration;
            _requestService = requestService;
        }

        public List<ApiStock> GetStocks(List<string> symbols)
        {
            List<KeyValuePair<string, string>> values = CombineValues(symbols);

            string apiSignature = CreateApiSignature(Get_Stocks_Url, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_Stocks_Url, values);

            return ((JObject)root.Data).GetValue("ProductList").ToObject<List<ApiStock>>();
        }

        public ApiCategory GetCategoriesTree(int CategoryId, Boolean Tree)
        {
            List<KeyValuePair<string, string>> values = CombineValues(null);
            if (CategoryId != -1)
            {
                values.Add(new KeyValuePair<string, string>("CategoryId", CategoryId.ToString()));
            }

            string apiSignature = CreateApiSignature(Get_Categories_Url, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_Categories_Url, values);

            return ((JObject)root.Data).GetValue("CategoryTree").ToObject<ApiCategory>();
        }


        //public List<SearchResult> Search(string country,
        //                                string language,
        //                                string SearchPlain,
        //                                string SearchCategory,
        //                                int SearchPage,
        //                                Boolean SearchWithStock,
        //                                //  string[][] SearchParameter,//o to aray of arays, czy to to
        //                                string SearchOrder,
        //                                string SearchOrderType
        //                                )
        //{
        //    var url = @"https://api.tme.eu/Products/Search.json";
        //    var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
        //    var suffixRequest = "";
        //    var values = new List<KeyValuePair<string, string>>();

        //    values.Add(new KeyValuePair<string, string>("Country", country));
        //    values.Add(new KeyValuePair<string, string>("Language", language));
        //    values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));
        //    values.Add(new KeyValuePair<string, string>("SearchPlain", SearchPlain));
        //    values.Add(new KeyValuePair<string, string>("SearchCategory", SearchCategory));
        //    values.Add(new KeyValuePair<string, string>("SearchPage", SearchPage.ToString()));
        //    values.Add(new KeyValuePair<string, string>("SearchWithStock", SearchWithStock.ToString()));
        //    // //  values.Add(new KeyValuePair<string, string>("SearchParameter", SearchParameter.ToString()));// czy dziala
        //    values.Add(new KeyValuePair<string, string>("SearchOrder", SearchOrder));
        //    values.Add(new KeyValuePair<string, string>("SearchOrderType", SearchOrderType));



        //    foreach (var el in values.OrderBy(x => x.Key))
        //    {

        //        suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));

        //    }


        //    string reply = this.SendPostRequest(url, values, UrlUtilities.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));

        //    var root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);

        //    var data = JsonConvert.DeserializeObject<SearchList>(root.Data.ToString());

        //    return data.SearchListResult;
        //}

        public List<ApiProduct> GetProducts(List<string> SymbolList)
        {
            List<KeyValuePair<string, string>> values = CombineValues(SymbolList);
            string apiSignature = CreateApiSignature(Get_Products_Url, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));
            RootObjectResponse root = _requestService.SendPostRequest(Get_Products_Url, values);
            return ((JObject)root.Data)["ProductList"].ToObject<List<ApiProduct>>();
        }

        public List<string> GetSymbols(string CategoryId)
        {
            List<KeyValuePair<string, string>> values = CombineValues(null);
            values.Add(new KeyValuePair<string, string>("CategoryId", CategoryId.ToString()));

            string apiSignature = CreateApiSignature(Get_Symbols_Url, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_Symbols_Url, values);

            return (((JObject)root.Data)["SymbolList"]).ToObject<List<string>>();
        }

        public ApiSearchResult Search(string searchText)
        {
            List<KeyValuePair<string, string>> values = CombineValues(null);
            values.Add(new KeyValuePair<string, string>("SearchPlain", searchText));

            string apiSignature = CreateApiSignature(Get_SearchResult, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_SearchResult, values);
            return ((JObject)root.Data).ToObject<ApiSearchResult>();
        }

        public ApiPriceResult<ApiProductPrice> GetPrices(List<string> SymbolList)
        {
            List<KeyValuePair<string, string>> values = CombineValues(SymbolList);
            values.Add(new KeyValuePair<string, string>("Currency", _apiConfiguration.Currency));

            string apiSignature = CreateApiSignature(Get_Prices_Url, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_Prices_Url, values);

            return ((JObject)root.Data).ToObject<ApiPriceResult<ApiProductPrice>>();
        }

        public List<ApiProductFiles> GetProductsFiles(List<string> SymbolList)
        {
            List<KeyValuePair<string, string>> values = CombineValues(SymbolList);

            string apiSignature = CreateApiSignature(Get_ProductFiles_Url, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_ProductFiles_Url, values);

            return ((JObject)root.Data).GetValue("ProductList").ToObject<List<ApiProductFiles>>();
        }

        public ApiPriceResult<ApiProductPriceAndStock> GetPricesAndStocks(List<string> SymbolList)
        {
            List<KeyValuePair<string, string>> values = CombineValues(SymbolList);
            values.Add(new KeyValuePair<string, string>("Currency", _apiConfiguration.Currency));

            string apiSignature = CreateApiSignature(Get_PricesAndStocks, values);
            values.Add(new KeyValuePair<string, string>("ApiSignature", apiSignature));

            RootObjectResponse root = _requestService.SendPostRequest(Get_PricesAndStocks, values);
            return ((JObject)root.Data).ToObject<ApiPriceResult<ApiProductPriceAndStock>>(); ;

        }


        private string CreateApiSignature(string url, List<KeyValuePair<string, string>> values)
        {
            string prefixRequest = PrefixRequest(url);
            string suffixRequest = "";

            foreach (KeyValuePair<string, string> el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }
            return UrlUtilities.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret);
        }


        private List<KeyValuePair<string, string>> CombineValues(List<string> SymbolList)
        {
            List<KeyValuePair<string, string>> values = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("Language", _apiConfiguration.Language),
                new KeyValuePair<string, string>("Token", _apiConfiguration.Token),
                new KeyValuePair<string, string>("Country", _apiConfiguration.Country)
            };

            for (int i = 0; i < SymbolList?.Count; i++)
            {
                values.Add(new KeyValuePair<string, string>("SymbolList[" + i + "]", SymbolList[i]));
            }

            return values;
        }
    }
}
