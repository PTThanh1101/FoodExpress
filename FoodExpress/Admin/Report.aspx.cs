using System;
using System.Data;
using System.Data.SqlClient;

namespace FoodExpress.Admin
{

    public partial class Report : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Selling Report";
                if (Session["Admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
            }
        }

        private void getReportDate(DateTime fromDate, DateTime toDate)
        {
            double grandTotal = 0;
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Selling_Report", con);
            cmd.Parameters.AddWithValue("@FromDate", fromDate);
            cmd.Parameters.AddWithValue("@ToDate", toDate);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    grandTotal += Convert.ToDouble(dr["TotalPrice"]);
                }
                lblTotal.Text = "Sold Cost: " + grandTotal + " VND";
                lblTotal.CssClass = "badge badge-primary";
            }
            else
            {
                // Đặt lại lblTotal khi không có đơn hàng
                lblTotal.Text = "No orders found for the selected date range.";
                lblTotal.CssClass = "badge badge-warning";
            }
            reReport.DataSource = dt;
            reReport.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime fromDate = Convert.ToDateTime(txtFromDate.Text);
            DateTime toDate = Convert.ToDateTime(txtToDate.Text);
            if (toDate > DateTime.Now)
            {
                Response.Write("<script>alert('ToDate cannot be greater than current date!');</script>");
            }
            else if (fromDate > toDate)
            {
                Response.Write("<script>alert('FromDate cannot be greater than ToDate!');</script>");
            }
            else
            {
                getReportDate(fromDate, toDate);
            }
        }
    }
}