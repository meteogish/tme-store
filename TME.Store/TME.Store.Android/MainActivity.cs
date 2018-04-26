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
using TME.Store.Registrations;
using Autofac;
using TME.Domain.Components;

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
            global::Xamarin.Forms.Forms.Init(this, bundle);

            ContainerBuilder builder = Factory.GetRegistrations();
            IConfigurationProvider configuration = new AppConfigurationProvider(this.Assets);
            builder.RegisterInstance(configuration);

            LoadApplication(new App(builder));
        }
    }
}

