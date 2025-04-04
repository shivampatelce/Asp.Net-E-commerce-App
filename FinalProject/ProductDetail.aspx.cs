using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject.Models;

namespace FinalProject
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["ProductID"];

                if (!string.IsNullOrEmpty(productId))
                {
                    Set_Product_Detail(int.Parse(productId));
                    Set_Cart_Quantity();
                }
                else
                {
                    Response.Redirect("Products.aspx");
                }
            }
        }

        private void Set_Product_Detail(int productID)
        {
            DataView productDetail = (DataView)ProductDetailSqlDataSource.Select(DataSourceSelectArguments.Empty);
            productDetail.RowFilter = "ProductID = '" + productID + "'";
            DataRowView row = productDetail[0];

            Product product = Get_Product_Details();

            BrandName.Text = product.Name;
            Model.Text = product.ModelName;
            Description.Text = row["Description"].ToString();
            Price.Text = product.Price.ToString();
        }

        protected void DecreaseQuantity_Click(object sender, EventArgs e)
        {
            int quantity = int.Parse(Quantity.Text);

            if (quantity > 1)
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<Models.Cart>();
                }

                List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];

                if (string.IsNullOrEmpty(Quantity.Text) || !int.TryParse(Quantity.Text, out int qty) || qty <= 0)
                {
                    return;
                }

                int productId = int.Parse(Request.QueryString["ProductID"]);

                Models.Cart existingItem = cart.FirstOrDefault(item =>
                {
                    return item != null && item.Product != null && item.Product.ProductID == productId;
                });

                if (existingItem != null)
                {
                    existingItem.Quantity = --existingItem.Quantity;

                    Session["Cart"] = cart;

                    Set_Cart_Quantity();
                }
                else
                {
                    quantity--;
                    Quantity.Text = quantity.ToString();
                }
            }
        }
        protected void IncreaseQuantity_Click(object sender, EventArgs e)
        {
            int quantity = int.Parse(Quantity.Text);

            if (quantity < 5)
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<Models.Cart>();
                }

                List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];

                if (string.IsNullOrEmpty(Quantity.Text) || !int.TryParse(Quantity.Text, out int qty) || qty <= 0)
                {
                    return;
                }

                int productId = int.Parse(Request.QueryString["ProductID"]);

                Models.Cart existingItem = cart.FirstOrDefault(item =>
                {
                    return item != null && item.Product != null && item.Product.ProductID == productId;
                });

                if (existingItem != null)
                {
                    existingItem.Quantity = ++existingItem.Quantity;

                    Session["Cart"] = cart;

                    Set_Cart_Quantity();
                }
                else
                {
                    quantity++;
                    Quantity.Text = quantity.ToString();
                }
            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<Models.Cart>();
            }

            List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];

            if (string.IsNullOrEmpty(Quantity.Text) || !int.TryParse(Quantity.Text, out int qty) || qty <= 0)
            {
                return;
            }

            int productId = int.Parse(Request.QueryString["ProductID"]);

            Models.Cart existingItem = cart.FirstOrDefault(item =>
            {
                return item != null && item.Product != null && item.Product.ProductID == productId;
            });

            if (existingItem != null)
            {
                existingItem.Quantity = existingItem.Quantity + qty;
            }
            else
            {
                Product product = Get_Product_Details();

                cart.Add(new Models.Cart(product, int.Parse(Quantity.Text)));
            }

            Session["Cart"] = cart;

            Set_Cart_Quantity();
        }

        private Product Get_Product_Details()
        {
            int productId = int.Parse(Request.QueryString["ProductID"]);
            DataView productDetail = (DataView)ProductDetailSqlDataSource.Select(DataSourceSelectArguments.Empty);
            productDetail.RowFilter = "ProductID = '" + productId + "'";

            if (productDetail.Count == 0)
                return null;

            DataRowView row = productDetail[0];

            return new Product(
                int.Parse(row["ProductID"].ToString()),
                row["Name"].ToString(),
                row["Brand"].ToString(),
                row["ModelName"].ToString(),
                int.Parse(row["Price"].ToString())
            );
        }

        private void Set_Cart_Quantity()
        {
            if (Session["Cart"] == null)
            {
                return;
            }

            List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];

            int productId = int.Parse(Request.QueryString["ProductID"]);

            Models.Cart cartItem = cart.FirstOrDefault(item =>
            {
                return item != null && item.Product != null && item.Product.ProductID == productId;
            });

            if (cartItem != null)
            {
                Quantity.Text = cartItem.Quantity.ToString();
                AddToCartButton.Visible = false;
                RemoveFromCart.Visible = true;
            }
            else
            {
                Quantity.Text = "1";
                AddToCartButton.Visible = true;
                RemoveFromCart.Visible = false;
            }
        }

        protected void RemoveFromCart_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                return;
            }

            List<Models.Cart> cart = (List<Models.Cart>)Session["Cart"];

            int productId = int.Parse(Request.QueryString["ProductID"]);

            Models.Cart itemToRemove = cart.FirstOrDefault(item =>
            item != null && item.Product != null && item.Product.ProductID == productId);

            if (itemToRemove != null)
            {
                cart.Remove(itemToRemove);
                Session["Cart"] = cart;
            }

            Set_Cart_Quantity();
        }
    }
}