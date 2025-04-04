using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Set_Welcome_Msg();
            }
        }

        private void Set_Welcome_Msg()
        {
            Models.Login login = (Models.Login)Session["Login"];
            if (login != null)
            {
                WelcomeMessage.Text = "Welcome back, " + login.FirstName + " " + login.LastName;
            }
            else
            {
                WelcomeMessage.Text = String.Empty;
            }
        }
    }
}