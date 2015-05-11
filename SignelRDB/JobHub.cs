using Microsoft.AspNet.SignalR;

namespace SignelRDB
{
    public class JobHub : Hub
    {
        public static void Show()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<JobHub>();
            context.Clients.All.displayStatus();
        }
    }
}