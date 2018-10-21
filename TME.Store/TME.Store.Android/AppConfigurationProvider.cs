using System.IO;
using Android.Content.Res;
using TME.Api.Domain.Models;
using TME.Api.Domain.Components;

[assembly: Xamarin.Forms.Dependency(typeof(TME.Store.Droid.AppConfigurationProvider))]
namespace TME.Store.Droid
{
    public class AppConfigurationProvider : IApiConfigurationProvider
    {
        public ApiConfiguration ApiConfiguration { get; private set; }

        public AppConfigurationProvider(AssetManager assetManager)
        {
            string fullSecret;
            using (StreamReader sr = new StreamReader(assetManager.Open("Secret.txt")))
            {
                fullSecret = sr.ReadToEnd();
            }
            string[] parts = fullSecret.Split('|');
            ApiConfiguration = new ApiConfiguration(parts[0], parts[1], "PL", "PLN", "PL");
        }
    }
}