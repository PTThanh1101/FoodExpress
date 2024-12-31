using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodExpress.User
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        decimal grandTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    getCartItems();
                }
            }

        }

        void getCartItems()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            reCartItem.DataSource = dt;
            if (dt.Rows.Count == 0)
            {
                reCartItem.FooterTemplate = null;
                reCartItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
            }
            reCartItem.DataBind();
        }
        protected void reCartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Utils utils = new Utils();
            if (e.CommandName == "remove")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Cart_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    getCartItems();
                    //Cart count
                    Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["UserId"]));
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error - " + ex.Message + "');<script>");
                }
                finally
                {
                    con.Close();
                }
            }

            if (e.CommandName == "updateCart")
            {
                bool isCartUpdated = false;
                for (int item = 0; item < reCartItem.Items.Count; item++)
                {
                    if (reCartItem.Items[item].ItemType == ListItemType.Item || reCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                    {

                        TextBox quantity = reCartItem.Items[item].FindControl("txtQuantity") as TextBox;
                        HiddenField _productId = reCartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                        HiddenField _quantity = reCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
                        int quantityFromCart = Convert.ToInt32(quantity.Text);
                        int ProductId = Convert.ToInt32(_productId.Value);
                        int quantityFromDB = Convert.ToInt32(_quantity.Value);
                        bool isTrue = false;
                        int updatedQuantity = 1;
                        if (quantityFromCart > quantityFromDB)
                        {
                            updatedQuantity = quantityFromCart;
                            isTrue = true;
                        }
                        else if (quantityFromCart < quantityFromDB)
                        {
                            updatedQuantity = quantityFromCart;
                            isTrue = true;
                        }
                        if (isTrue)
                        {
                            //Update cart item's quantity in DB
                            isCartUpdated = utils.updateCartQuantity(updatedQuantity, ProductId, Convert.ToInt32(Session["UserId"]));
                        }
                    }
                }
                getCartItems();
            }

            if (e.CommandName == "checkout")
            {
                bool isTrue = false;
                string proName = string.Empty;
                //First check item quantity
                for (int item = 0; item < reCartItem.Items.Count; item++)
                {
                    if (reCartItem.Items[item].ItemType == ListItemType.Item || reCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                    {
                        HiddenField _productId = reCartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                        HiddenField _cartQuantity = reCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
                        HiddenField _productQuantity = reCartItem.Items[item].FindControl("hdnPrdQuantity") as HiddenField;
                        Label productName = reCartItem.Items[item].FindControl("lblName") as Label;
                        int productId = Convert.ToInt32(_productId.Value);
                        int cartQuantity = Convert.ToInt32(_cartQuantity.Value);
                        int productQuantity = Convert.ToInt32(_productQuantity.Value);
                        if (productQuantity > cartQuantity && productQuantity > 2)
                        {
                            isTrue = true;
                        }
                        else
                        {
                            isTrue = false;
                            proName = productName.Text.ToString();
                            break;
                        }
                    }
                }
                if (isTrue)
                {
                    Response.Redirect("Payment.aspx");
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Our <b>'" + proName + "'</b> item's quantity is not enough to supply for your need:< ";
                    lblMsg.CssClass = "alert alert-warning";
                }
            }
        }

        protected void reCartItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label totalPrice = e.Item.FindControl("lblTotalPrice") as Label;
                Label productPrice = e.Item.FindControl("lblPrice") as Label;
                TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
                decimal calTotalPrice = Convert.ToDecimal(productPrice.Text) * Convert.ToDecimal(quantity.Text);
                totalPrice.Text = calTotalPrice.ToString();
                grandTotal += calTotalPrice;
            }
            Session["grandTotalPrice"] = grandTotal;
        }

        // Custom template class to add controls to the repeater's header, item and footer sections.
        private sealed class CustomTemplate : ITemplate
        {
            private ListItemType ListItemType { get; set; }
            public CustomTemplate(ListItemType type)
            {
                ListItemType = type;
            }
            public void InstantiateIn(Control container)
            {
                if (ListItemType == ListItemType.Footer)
                {
                    var footer = new LiteralControl("<tr><td colspan='5'><b>Your Cart is empty.</b><a href='Menu.aspx' class='badge badge-info ml-2'>Continue Shopping</a></td></tr></tbody></table>");
                    container.Controls.Add(footer);
                }
            }
        }
    }
}