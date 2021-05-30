using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class super : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Role"] =="")
            {

                Response.Redirect("login.aspx");

           
            }
            else
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");

       
                lblUserName.Text = "Welcome  :" + Session["Name"].ToString().ToUpper() + "<br> Role :" + Session["Role"].ToString().ToUpper() + " Admin";

            }
        }
    }
    protected void btnlink_Click(object sender, EventArgs e)
    {
        try
        {
            Session["Role"] = null;
            Session.Abandon();
            Session.RemoveAll();
            Server.Transfer("login.aspx", false);
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }
    }
}
