using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["Role"] == null)
               Server.Transfer("login.aspx");
            else
            {
                Response.ClearHeaders();
              Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
              Response.AddHeader("Pragma", "no-cache");
              lblUserName.Text = "Welcome : " + Session["Name"].ToString().ToUpper() + "<br> <style='text-align:center'>Role :" + Session["Examname"].ToString() + "";
   
            }
        }
        else
        {
            lblUserName.Text = "Welcome TO : " + Session["Examname"].ToString();
        }

    }
    protected void btnLink_Click(object sender, EventArgs e)
    {  
        Session["Role"] = null;
        Session.Abandon();
        Session.RemoveAll();
        Server.Transfer("login.aspx",false);
   

    }
}
