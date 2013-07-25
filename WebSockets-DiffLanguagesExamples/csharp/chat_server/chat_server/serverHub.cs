using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace chat_server
{
    public class serverHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }
    }
}