using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ClienteQSP.Startup))]
namespace ClienteQSP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
