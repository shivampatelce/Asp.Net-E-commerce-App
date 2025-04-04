using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateCartTable();
            if (!IsPostBack)
            {
                if (Session["Login"] == null)
                {
                    Response.Redirect("Login");
                }
            }
        }

        private void PopulateCartTable()
        {
            // Clear existing rows
            CartTable.Rows.Clear();
            CartTable.CssClass = "table table-striped table-bordered";

            // Add header row
            TableRow headerRow = new TableRow { CssClass = "table-primary" };

            headerRow.Cells.Add(new TableCell { Text = "Books", CssClass = "header-cell text-center fw-bold" });
            headerRow.Cells.Add(new TableCell { Text = "Quantity", CssClass = "header-cell text-center fw-bold" });
            headerRow.Cells.Add(new TableCell { Text = "Unit-Price", CssClass = "header-cell text-center fw-bold" });
            headerRow.Cells.Add(new TableCell { Text = "Amount", CssClass = "header-cell text-center fw-bold" });
            headerRow.Cells.Add(new TableCell { Text = "Action", CssClass = "header-cell text-center fw-bold" });

            CartTable.Rows.Add(headerRow);

            if (Session["Cart"] != null && ((List<Models.Cart>)Session["Cart"]).Count != 0)
            {
                List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];

                foreach (var cartItem in cart)
                {
                    TableRow row = new TableRow();

                    // Add table header
                    row.Cells.Add(new TableCell { Text = cartItem.Product.Name, CssClass = "text-center align-middle" });
                    row.Cells.Add(new TableCell { Text = cartItem.Quantity.ToString(), CssClass = "text-center align-middle" });
                    row.Cells.Add(new TableCell { Text = $"${cartItem.Product.Price:F2}", CssClass = "text-center align-middle" });
                    row.Cells.Add(new TableCell { Text = $"${(cartItem.Product.Price * cartItem.Quantity):F2}", CssClass = "text-center align-middle" });

                    // Add delete button
                    TableCell actionCell = new TableCell { CssClass = "text-center align-middle" };
                    Button deleteButton = new Button
                    {
                        Text = "Remove",
                        CommandArgument = cartItem.Product.ProductID.ToString(),
                        CssClass = "btn btn-danger"
                    };
                    deleteButton.Click += DeleteButton_Click;

                    actionCell.Controls.Add(deleteButton);
                    row.Cells.Add(actionCell);

                    // Add row to the table
                    CartTable.Rows.Add(row);

                    Update_Billing_Summary(cart);
                    BillingSummaryBlock.Visible = true;
                }

                EmptyCart.Visible = true;
            }
            else
            {
                TableRow emptyRow = new TableRow();
                TableCell emptyCell = new TableCell
                {
                    ColumnSpan = 5,
                    Text = "<br /><br /><strong>Your cart is empty.</strong><br /><br /><a href='Products' class='btn btn-primary'>Add Product</a><br /><br />",
                    HorizontalAlign = HorizontalAlign.Center
                };
                emptyRow.Cells.Add(emptyCell);
                CartTable.Rows.Add(emptyRow);

                BillingSummaryBlock.Visible = false;
                EmptyCart.Visible = false;
            }
        }

        private void Update_Billing_Summary(List<Models.Cart> cart)
        {
            decimal subTotal = 0;

            // Calculate the subtotal
            foreach (var item in cart)
            {
                subTotal += item.Quantity * (decimal)item.Product.Price;
            }

            Amount.Text = $"${subTotal:F2}";

            // Apply 13% tax
            decimal tax = subTotal * 0.13m;
            Tax.Text = $"${tax:F2}";

            // Calculate the total
            decimal total = subTotal + tax;
            TotalAmount.Text = $"${total:F2}";
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button deleteButton = (Button)sender;
            int productId = int.Parse(deleteButton.CommandArgument);

            // Remove the item from the cart
            if (Session["Cart"] != null)
            {
                List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];
                Models.Cart itemToRemove = cart.FirstOrDefault(item => item.Product.ProductID == productId);

                if (itemToRemove != null)
                {
                    cart.Remove(itemToRemove);
                }

                // Update the session
                Session["Cart"] = cart;

                // Repopulate the table
                PopulateCartTable();
            }
        }

        protected void EmptyCart_Click(object sender, EventArgs e)
        {
            Session["Cart"] = null;
            PopulateCartTable();
        }

        protected void CheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout");
        }

        protected void CountinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products");
        }
    }
}