using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class changepwd : System.Web.UI.Page
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
            bindProfileDetails();
        }
    }
    private void bindProfileDetails()
    {
        try
        {
            string s = "Select * from Users where Username='" + Session["Name"].ToString() + "'";


            SqlConnection con = new SqlConnection(constring);
            con.Open();
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtEmailId.Text = dr[3].ToString();
                txtFirstName.Text=dr[4].ToString();
                txtLastName.Text=dr[5].ToString();
                txtMobile.Text=dr[7].ToString();
               radiogender.SelectedValue=dr[9].ToString();
                txtAddress.Text = dr[10].ToString().Replace("\"","'");
            }
        }
        catch(Exception ex)
        {
            lblError.Text=ex.Message.ToString();
        }
        
    }    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtNew.Text == txtCurrent.Text)
            {
                lblgnder.Text = "";
                lblError.Text = "<span style='color:red'>Current Password and New Password should not be same... </span>";
           
            }
            else
            {
                lblgnder.Text = "";
                string uname = Session["Role"].ToString();
                using (SqlConnection con = new SqlConnection(constring))
                {
                    string exam = "Update Users set  password='" + txtConfirm.Text.Trim() + "' WHERE ( password COLLATE Latin1_General_CS_AS='" + txtCurrent.Text.Trim() + "') and Username='" + Session["Name"].ToString() + "'";
                    con.Open();
                    SqlCommand cd = new SqlCommand(exam, con);
                    int up = cd.ExecuteNonQuery();
                    con.Close();
                    if (up > 0)
                    {
                        lblError.Text = "<span style='color:Green'>Updated Successfully </span>";
                    }
                    else
                    {
                        lblError.Text = "<span style='color:red'>Please check Current Password... </span>";
                    }
                }
            }

        }
            catch(Exception ex)
        {
                ex.Message.ToString();
            }
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        txtCurrent.Text = "";
        txtConfirm.Text = "";
        txtNew.Text = "";
        lblError.Text = "";
    }
    protected void sbtButton_Click(object sender, EventArgs e)
    {
        try
        {

            txtAddress.Text = txtAddress.Text.Trim().Replace("'", "\"");
            lblError.Text = "";
                SqlConnection con = new SqlConnection(constring);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Users Set  Fname='" + txtFirstName.Text.Trim() + "',Lname='" + txtLastName.Text.Trim() + "',Mobile=" + txtMobile.Text.Trim() + ",Gender='" + radiogender.SelectedItem.ToString() + "',Address='" + txtAddress.Text.Trim() + "',    Email='" + txtEmailId.Text.Trim() + "' where username='" +Session["Name"].ToString() + "' ", con);
                int n = cmd.ExecuteNonQuery();
              if(n>0)
              {
                lblgnder.Text = "<span style='color:green'>Updated Successfully...</span>";
                bindProfileDetails();
              }
              else
              {
                  lblgnder.Text = "<sapn style='color:red'>Profile not updated...</span>";
              }
             con.Close();
                
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnbtncancel_Click(object sender, EventArgs e)
    {
        lblgnder.Text = "";
        bindProfileDetails();
    }
}