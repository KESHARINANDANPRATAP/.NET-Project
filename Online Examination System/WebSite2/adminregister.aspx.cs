using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adminregister : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["con"].ToString();
    public void page_preinit(object sender, EventArgs e)
    {
        try
        {

            if (Convert.ToString(Session["Role"]) != "")
            {
                if (Convert.ToString(Session["Role"]) == "admin")
                {
                    this.MasterPageFile = "admin.master";
                }
                else if (Convert.ToString(Session["Role"]) == "super")
                {
                    this.MasterPageFile = "super.master";
                }
            }

            else
            {
                Server.Transfer("login.aspx", false);
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }  
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindexamnamedetails();
        }

    }
    private void bindexamnamedetails()
    {
        try
        {
            SqlConnection connection = new SqlConnection(constring);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select Examname,Examid FROM Exampattern", connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlRole.DataSource = ds;
            ddlRole.DataTextField = "Examname";
            ddlRole.DataValueField = "Examid";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("--Select--", "0"));
            connection.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void sbtButton_Click(object sender, EventArgs e)
    {       
        try
        {
            if (ddlRole.SelectedIndex == 0 || ddlRole.SelectedItem.ToString()=="--Select--")
            {
                lblgnder.Text = "Select Designation.";
            }
            else
            {

                txtAddress.Text =txtAddress.Text.Replace("'", "\"");

                int userId = 0;
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("Insert_Admin");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text.ToLower().Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmailId.Text.Trim());
                cmd.Parameters.AddWithValue("@Fname", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@Lname", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@Role", "admin");
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", "Active");
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", radiogender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Examname", ddlRole.SelectedItem.ToString());
                cmd.Connection = con;
                con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Username already exists.<br>Please choose a different username.";
                        break;
                    case -2:
                        message = "Email id already exists <br> Please choose a different Email id";
                        break;
                    default:

                        message = "Registration successfully.";

                        break;
                }
                if (message == "Registration successfully.")
                {

                    clearcontrols();
                    lblgnder.Text = "<span: style='color:green'>Successfully Registered</span>";
                  
                }
                else
                {
                    lblgnder.Text = message;
                }
            }
        }
        catch(Exception ex)
        {
            Response.Write("error" + ex);
        } 
    }
     private void clearcontrols()
    {
        try
        {
            lblgnder.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtEmailId.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtMobile.Text = "";
            txtAddress.Text = "";
            radiogender.SelectedIndex = -1;
            ddlRole.SelectedIndex = 0;
        }
         catch(Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        clearcontrols();
    }
}