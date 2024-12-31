using System;
using System.Data;
using System.Data.SqlClient;

namespace FoodExpress.User
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                lblUserName.Text = Session["UserName"].ToString();
                lblEmail.Text = Session["Email"].ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("ContactSp", con);
                cmd.Parameters.AddWithValue("@Action", "INSERT");
                cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["UserId"]));
                cmd.Parameters.AddWithValue("@Username", Session["Username"]);
                cmd.Parameters.AddWithValue("@Email", Session["Email"]);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.ToString());
                cmd.Parameters.AddWithValue("@Message", txtMessage.Text.ToString());
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Thanks your reaching out, we will look into your query!";
                lblMsg.CssClass = "alert alert-success";
                clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        private void clear()
        {
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}