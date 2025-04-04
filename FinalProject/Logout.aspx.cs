using System;

namespace FinalProject
{
	public partial class Logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            Session.Clear();
            Response.Redirect("Default");
        }
	}
}