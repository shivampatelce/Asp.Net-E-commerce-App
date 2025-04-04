using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null)
                {
                    Models.Login login = (Models.Login)Session["Login"];
                    if (login.FirstName != "admin")
                    {
                        Response.Redirect("Default");
                    }
                }
                else
                {
                    Response.Redirect("Login");
                }
            }
        }
    }
}