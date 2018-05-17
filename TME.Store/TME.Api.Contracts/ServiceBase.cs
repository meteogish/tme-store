using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using TME.Api.Domain.Components;
using TME.Api.Domain.Models;

namespace TME.Api.Contracts
{
    public class ServiceBase : IRequestService
    {
        /// <summary>
        /// Send POST message to TME API
        /// </summary>
        /// <param name="url">post method addres</param>
        /// <param name="values">parameters to post method</param>
        /// <returns> string result </returns>
        public RootObjectResponse SendPostRequest(string url, List<KeyValuePair<string, string>> values)
        {
            using (HttpClient client = new HttpClient())
            {
                // add values to data for post
                FormUrlEncodedContent content = new FormUrlEncodedContent(values);

                // Post data
                HttpResponseMessage result = client.PostAsync(url, content).Result;

                // Access content as stream which you can read into some string
                System.Threading.Tasks.Task<string> res = result.Content.ReadAsStringAsync();
                //sprawdzac czy dane czy error i zwraca root object response
                return JsonConvert.DeserializeObject<RootObjectResponse>(res.Result);
            }
        }

    }
}
