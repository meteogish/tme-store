using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using TME.Domain.Components;
using TME.Domain.Models;
using TME.Store.Api.Logic;
using TME.Store.Api.Data;

namespace TME.Store.Api
{
    public class ProductsWrapper : ServiceBase, IProductsProvider, IStocksProvider, ICategoriesProvider, ISearchService,IPricesProvider,IProductFilesProvider
    {
        private ApiConfiguration _apiConfiguration;

        public ProductsWrapper(IConfigurationProvider configurationProvider)
        {
            _apiConfiguration = configurationProvider.ApiConfiguration;
        }

        public List<Stock> GetStocks(List<string> symbolList)
        {
            var url = @"https://api.tme.eu/Products/GetStocks.json";
            var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
            var suffixRequest = "";
            var values = new List<KeyValuePair<string, string>>();

            values.Add(new KeyValuePair<string, string>("Language", _apiConfiguration.Language));

            for (int i = 0; i < symbolList.Count; i++)
            {
                values.Add(new KeyValuePair<string, string>("SymbolList[" + i + "]", symbolList[i]));

            }
            values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));
            values.Add(new KeyValuePair<string, string>("Country", _apiConfiguration.Country));

            foreach (var el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }

            string reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));

            RootObjectResponse root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);
            return ((JObject)root.Data).GetValue("ProductList").ToObject<List<Stock>>();
            //var data = JsonConvert.DeserializeObject<StocksList>(root.Data.ToString());
        }

        public Category GetCategoriesTree(int CategoryId, Boolean Tree)
        {
            var url = @"https://api.tme.eu/Products/GetCategories.json";
            var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
            var suffixRequest = "";
            var values = new List<KeyValuePair<string, string>>();

            values.Add(new KeyValuePair<string, string>("Language", _apiConfiguration.Language));

            if (CategoryId != -1)
                values.Add(new KeyValuePair<string, string>("CategoryId", CategoryId.ToString()));
            values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));
            values.Add(new KeyValuePair<string, string>("Country", _apiConfiguration.Country));
            //  values.Add(new KeyValuePair<string, string>("Tree", Tree.ToString()));

            foreach (var el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }

            var reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));
            var root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);
            return ((JObject)root.Data).GetValue("CategoryTreeObject").ToObject<Category>();
            //var data = JsonConvert.DeserializeObject<CategoryTree>(root.Data.ToString());
            //return data.CategoryTreeObject;
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


        //    var reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));

        //    var root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);

        //    var data = JsonConvert.DeserializeObject<SearchList>(root.Data.ToString());

        //    return data.SearchListResult;
        //}

        public List<Product> GetProducts(List<string> SymbolList)
        {
            var url = @"https://api.tme.eu/Products/GetProducts.json";
            var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
            var suffixRequest = "";
            var values = new List<KeyValuePair<string, string>>();

            values.Add(new KeyValuePair<string, string>("Country", _apiConfiguration.Country));
            values.Add(new KeyValuePair<string, string>("Language", _apiConfiguration.Language));
            values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));


            for (int i = 0; i < SymbolList.Count; i++)
            {
                values.Add(new KeyValuePair<string, string>("SymbolList[" + i + "]", SymbolList[i]));
            }

            foreach (var el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }
            var reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));

            RootObjectResponse root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);

            return ((JObject)root.Data)["ProductList"].ToObject<List<Product>>();
        }

        public Symbols GetSymbols(string CategoryId)
        {
            var url = @"https://api.tme.eu/Products/GetSymbols.json";
            var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
            var suffixRequest = "";
            var values = new List<KeyValuePair<string, string>>();

            values.Add(new KeyValuePair<string, string>("Country", _apiConfiguration.Country));
            values.Add(new KeyValuePair<string, string>("Language", _apiConfiguration.Language));
            values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));
            values.Add(new KeyValuePair<string, string>("CategoryId", CategoryId));


            foreach (var el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }

            var reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));

            return JsonConvert.DeserializeObject<Symbols>(reply);
        }

        public List<SearchResult> Search(string searchText)
        {
            throw new NotImplementedException();
        }

        public PriceResult GetPrices(string Currency, List<string> SymbolList)
        {
            var url = @"https://api.tme.eu/Products/GetPrices.json";
            var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
            var suffixRequest = "";
            var values = new List<KeyValuePair<string, string>>();

            values.Add(new KeyValuePair<string, string>("Language", _apiConfiguration.Language));
            values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));
            values.Add(new KeyValuePair<string, string>("Country", _apiConfiguration.Country));
            values.Add(new KeyValuePair<string, string>("Currency", Currency));
            for (int i = 0; i < SymbolList.Count; i++)
            {
                values.Add(new KeyValuePair<string, string>("SymbolList[" + i + "]", SymbolList[i]));

            }
         

            foreach (var el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }

            string reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));

            RootObjectResponse root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);
            
            return ((JObject)root.Data).ToObject<PriceResult>();
        }

        public List<ProductFiles> GetProductsFiles(List<string> SymbolList)
        {
            var url = @"https://api.tme.eu/Products/GetProductsFiles.json";
            var prefixRequest = "POST" + "&" + WebUtility.UrlEncode(@url) + "&";
            var suffixRequest = "";
            var values = new List<KeyValuePair<string, string>>();

            values.Add(new KeyValuePair<string, string>("Language", _apiConfiguration.Language));
 
            values.Add(new KeyValuePair<string, string>("Token", _apiConfiguration.Token));
            values.Add(new KeyValuePair<string, string>("Country", _apiConfiguration.Country));
            for (int i = 0; i < SymbolList.Count; i++)
            {
                values.Add(new KeyValuePair<string, string>("SymbolList[" + i + "]", SymbolList[i]));

            }

            foreach (var el in values.OrderBy(x => x.Key))
            {
                suffixRequest += suffixRequest.Length > 1 ? WebUtility.UrlEncode("&" + WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value)) : WebUtility.UrlEncode(WebUtility.UrlEncode(el.Key) + "=" + WebUtility.UrlEncode(el.Value));
            }

            var reply = this.SendPostRequest(url, values, Utlis.CreateToken(prefixRequest + suffixRequest, _apiConfiguration.Secret));
            var root = JsonConvert.DeserializeObject<RootObjectResponse>(reply);
           
            return  ((JObject)root.Data).GetValue("ProductList").ToObject<List<ProductFiles>>();
        }
    }   
}




