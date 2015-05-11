using Microsoft.Owin;
using Owin;
[assembly: OwinStartup(typeof(SignelRDB.Startup))]
namespace SignelRDB
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
             app.MapSignalR();
        }
    }
}