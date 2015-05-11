using System.Configuration;
using System.Data.SqlClient;
using System.Web.Mvc;
using System.Web.Routing;
using Owin;

namespace SignelRDB
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteTable.Routes.MapOwinRoute("Home/Index", app => app.RunSignalR());
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            SqlDependency.Start(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString); 
        }
        protected void Application_End()
        {
            SqlDependency.Stop(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        }
    }
}
