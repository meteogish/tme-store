﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TME.Store.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class LoadingView : ContentView
	{
		public LoadingView ()
		{
			InitializeComponent ();
		}
	}
}