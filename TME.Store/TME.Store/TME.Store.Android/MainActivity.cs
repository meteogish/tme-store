using System;
using System.IO;
using Android.App;
using Android.Content.PM;
using Android.Content.Res;
using Android.Media;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;

namespace TME.Store.Droid
{
    [Activity(Label = "TME.Store", Icon = "@drawable/icon", Theme = "@style/MainTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation)]
    public class MainActivity : global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {
        protected override void OnCreate(Bundle bundle)
        {
            TabLayoutResource = Resource.Layout.Tabbar;
            ToolbarResource = Resource.Layout.Toolbar;

            base.OnCreate(bundle);
            string fullSecret;
            AssetManager assets = this.Assets;
            using (StreamReader sr = new StreamReader(assets.Open("Secret.txt")))
            {
                fullSecret = sr.ReadToEnd();
            }
            string[] parts = fullSecret.Split('|');
            global::Xamarin.Forms.Forms.Init(this, bundle);
            LoadApplication(new App(parts[0], parts[1]));
        }
    }
}

