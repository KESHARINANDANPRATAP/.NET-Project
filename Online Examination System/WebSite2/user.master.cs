using System;

public partial class use : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["Username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.ClearHeaders();
               Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
               Response.AddHeader("Pragma", "no-cache");
            }
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }

    }
   }
