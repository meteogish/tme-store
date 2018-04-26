using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.Content.Res;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using TME.Domain.Components;
using TME.Domain.Models;

namespace TME.Store.Droid
{
    public class AppConfigurationProvider : IConfigurationProvider
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
            ApiConfiguration = new ApiConfiguration(parts[0], parts[1], "PL", "EN");
        }
    }
}