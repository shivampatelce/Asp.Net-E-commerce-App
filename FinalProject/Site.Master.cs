using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Set_Active_Link();
                if (Is_Logged_In())
                {
                    LoginOption.Visible = false;
                    LogoutOption.Visible = true;
                    ProductsOption.Visible = true;
                    CartOption.Visible = true;
                    AdminOption.Visible = Is_Admin();
                }
                else
                {
                    LoginOption.Visible = true;
                    LogoutOption.Visible = false;
                    ProductsOption.Visible = false;
                    CartOption.Visible = false;
                    AdminOption.Visible = false;
                }
            }
        }

        private void Set_Active_Link()
        {
            String pageTitle = this.Page.Title;
            String activeLinkClass = "nav-link active";
            if (pageTitle == "Home")
            {
                homeLink.CssClass = activeLinkClass;
            }
            else if (pageTitle == "Products")
            {
                ProductsLink.CssClass = activeLinkClass;
            }
            else if (pageTitle == "Cart")
            {
                CartLink.CssClass = activeLinkClass;
            }
            else if (pageTitle == "Admin")
            {
                AdminLink.CssClass = activeLinkClass;
            }
            else if (pageTitle == "Login")
            {
                loginLink.CssClass = activeLinkClass;
            }
        }

        private Boolean Is_Logged_In()
        {
            return Session["Login"] != null;
        }

        private Boolean Is_Admin()
        {
            Models.Login login = (Models.Login)Session["Login"];
            return login.FirstName == "admin";
        }
    }
}