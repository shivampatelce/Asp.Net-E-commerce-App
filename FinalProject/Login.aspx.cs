using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Session["Login"] = new Models.Login(FirstName.Text, LastName.Text);
            Response.Redirect("Default");
        }
    }
}