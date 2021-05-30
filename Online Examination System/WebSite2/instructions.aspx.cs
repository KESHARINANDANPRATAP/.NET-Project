using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class instructions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
            

            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Server.Transfer("login.aspx");

                }
                else
                {
                    lblusername.Text = "Welcome :" + Convert.ToString(Session["Username"]);
                     
                     }

            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }


    }

 protected void btnSubmit_Click(object sender, EventArgs e)
        {
        try
        {
                if (chkAgry.Checked == true)
                {
                    Session["table"] = null;
                    Response.Redirect("Studentexam.aspx",false);   
                }
                else
                {
                    lbldisplay.Visible = true;
                 }
           
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }

    }
 protected void btncancel_Click(object sender, EventArgs e)
 {
     
     chkAgry.Checked = false;
 }
 protected void btnlinksignout_Click(object sender, EventArgs e)
 {
     try
     {
         Session.RemoveAll();
         Response.Redirect("login.aspx", false);
    
     }
  catch(Exception EX)
     {
         lbldisplay.Text= EX.Message.ToString();
     }
         
 }
}