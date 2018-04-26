using Autofac;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using TME.Store.Registrations.Modules;

namespace TME.Store.Registrations
{
    public static class Factory
    {
        public static ContainerBuilder GetRegistrations()
        {
            ContainerBuilder builder = new ContainerBuilder();
            builder.RegisterAssemblyModules(Assembly.GetExecutingAssembly());
            return builder;
        }
    }
}
