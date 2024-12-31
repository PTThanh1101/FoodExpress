﻿using System;

namespace FoodExpress.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "";
                if (Session["Admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    DashboardCount dashboard = new DashboardCount();
                    Session["category"] = dashboard.Count("CATEGORY");
                    Session["product"] = dashboard.Count("PRODUCT");
                    Session["order"] = dashboard.Count("ORDER");
                    Session["delivered"] = dashboard.Count("DELIVERED");
                    Session["pending"] = dashboard.Count("PENDING");
                    Session["user"] = dashboard.Count("USER");
                    Session["soldAmount"] = dashboard.Count("SOLDAMOUNT");
                    Session["contact"] = dashboard.Count("CONTACT");
                }
            }
        }
    }
}