using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodExpress.Admin
{
    public partial class ContactAd : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Contact Users";
                if (Session["Admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    getContacts();
                }

            }
        }

        private void getContacts()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("ContactSp", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            reContacts.DataSource = dt;
            reContacts.DataBind();
        }

        protected void reContacts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("ContactSp", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ContactId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Record deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getContacts();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}