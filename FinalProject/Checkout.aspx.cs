using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] == null)
                {
                    Response.Redirect("Login");
                }
                else
                {
                    LoadCartSummary();
                }
            }
        }

        private void LoadCartSummary()
        {
            decimal subtotal = 0;

            if (Session["Subtotal"] != null)
            {
                decimal.TryParse(Session["Subtotal"].ToString(), out subtotal);
            }

            decimal tax = subtotal * 0.13m; // 13% tax
            decimal total = subtotal + tax;

            lblSubtotal.Text = $"${subtotal:F2}";
            lblTax.Text = $"${tax:F2}";
            lblTotal.Text = $"${total:F2}";
        }

        private bool IsValidExpiryDate(string expiry)
        {
            try
            {
                string[] parts = expiry.Split('/');
                int month = int.Parse(parts[0]);
                int year = int.Parse("20" + parts[1]);

                var expiryDate = new DateTime(year, month, 1).AddMonths(1).AddDays(-1); // End of expiry month
                return expiryDate >= DateTime.Now.Date;
            }
            catch
            {
                return false;
            }
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            ddlProvince.SelectedIndex = 0;
            txtPostalCode.Text = "";
            txtCardName.Text = "";
            txtCardNumber.Text = "";
            txtExpiry.Text = "";
            txtCVV.Text = "";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string expiry = txtExpiry.Text.Trim();
                if (!IsValidExpiryDate(expiry))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidExpiry", "alert('Card expiry date must be in the future.');", true);
                    return;
                }
                else
                {
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string email = txtEmail.Text;
                    string phone = txtPhone.Text;
                    string address = txtAddress.Text;
                    string city = txtCity.Text;
                    string province = ddlProvince.SelectedValue;
                    string postalCode = txtPostalCode.Text;
                    string cardName = txtCardName.Text;
                    string cardNumber = txtCardNumber.Text;
                    string cvv = txtCVV.Text;

                    string message = $"Thank you {firstName}, your order has been placed successfully!";

                    ClearForm();

                    Session["Cart"] = null;
                    Session["Subtotal"] = null;

                    ScriptManager.RegisterStartupScript(this, GetType(), "Success", $"alert('{message}'); window.location='Default.aspx';", true);
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart");
        }
    }
}