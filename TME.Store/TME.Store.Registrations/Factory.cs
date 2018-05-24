using Autofac;
using System.Reflection;

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
