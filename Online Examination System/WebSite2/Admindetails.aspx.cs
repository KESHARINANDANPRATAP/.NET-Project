using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admindetails : System.Web.UI.Page
{
    DataTable dt;

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
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection connection = new SqlConnection(constring);

            if (Request.QueryString["Activeadmin"] == "Activeadmin")
            {
                lblsend.Text = "Admin Details"; 
                if (!IsPostBack)
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("Select Examname,Examid FROM Exampattern order by Examname", connection);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable ds = new DataTable();
                    da.Fill(ds);
                    ddlDesignation.DataSource = ds;
                    ddlDesignation.DataTextField = "Examname";
                    ddlDesignation.DataValueField = "Examid";
                    ddlDesignation.DataBind();
                    ddlDesignation.Items.Insert(0, new ListItem("--Select--", "0"));
                    connection.Close();
                }
                if (gvAdminusers.Rows.Count == 0)
                {
                }
                ddlbind("Active");
            }
            else if(Request.QueryString["Inactiveadmin"]=="Inactiveadmin")
            {
                 if (!IsPostBack)
                {
                    lblsend.Text = "Inactive Admins";
                    ddlbind("Inactive");
                    gvAdminusers.DataSource = dt;
                    gvAdminusers.DataBind();
                   
                    if (gvAdminusers.Rows.Count > 0)
                    {
                        for (int i = 0; i < gvAdminusers.Rows.Count; i++)
                        {
                            gvAdminusers.Rows[i].Cells[0].Visible = false;
                            gvAdminusers.HeaderRow.Cells[0].Visible = false;
                        }
                        lblupdate.Text = "<span style='color:green'>Total Number of Inactive Admins are : " + dt.Rows.Count+"</span>" ;
                    }
                    else
                    {
                        lblupdate.Text = "";
                    }                   
                }                
            }
            else
            {
                Server.Transfer("login.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
 }
    private void ddlbind(string s)
    {
        try
        {
            SqlConnection connection = new SqlConnection(constring);
            SqlDataAdapter adapter = new SqlDataAdapter("select Fname,Lname,Email,Username,Mobile,tdUser.Examname,Examid,Gender,Address from Users tdUser Left join Exampattern tdExam on (tdUser.Examname=tdExam.Examname) where Role='admin' and status='"+s+"' order by Username", connection);
            dt = new DataTable();
            adapter.Fill(dt);
            gvAdminusers.DataSource = dt;
            gvAdminusers.DataBind();

            if (s == "Active")
            {
                gvAdminusers.HeaderRow.Cells[0].Text = "Action";
                gvAdminusers.Columns[9].Visible = false;
            }
            else
            {
                if (gvAdminusers.Rows.Count > 0)
                {
                    for (int i = 0; i < gvAdminusers.Rows.Count; i++)
                    {
                        gvAdminusers.Rows[i].Cells[0].Visible = false;
                        gvAdminusers.HeaderRow.Cells[0].Visible = false;
                    }
                    lblupdate.Text = "<span style='color:green'>Total Number of Inactive Admins : " + dt.Rows.Count + "</span>";
                }
                else
                {
                    lblupdate.Text = "";
                }
            }
           
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gvAdminusers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            lblupdate.Text = "";
            GridViewRow row = (GridViewRow)gvAdminusers.Rows[e.RowIndex];
            Label l = (Label)row.FindControl("Username");
            SqlConnection connection = new SqlConnection(constring);
            connection.Open();
            SqlCommand cmd = new SqlCommand("update Users set Status='Inactive' where Username='" + (l.Text) + "'", connection);
            int result = cmd.ExecuteNonQuery();
            connection.Close();
            if (result == 1)
            {
                ddlbind("Active");
                lblupdate.Text = "<span style='color:green;'>Deleted Details Successfully.</span>";
                panelEdit.Visible = false;
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }      
    }
    protected void gvAdminusers_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblupdate.Text = "";
            gvAdminusers.SelectedRowStyle.CssClass = "selectedrow";
            panelEdit.Visible = true;
            GridViewRow row = (GridViewRow)gvAdminusers.SelectedRow;
            Label l = (Label)row.FindControl("Username");
            lblUser.Text = l.Text;
            Label k = (Label)row.FindControl("Fname");
            txtFname.Text = k.Text;
            Label j = (Label)row.FindControl("Lname");
            txtLname.Text = j.Text;
            Label gen = (Label)row.FindControl("Address");
            txtAddress.Text = gen.Text.Replace("\"", "'");
            Label y = (Label)row.FindControl("mailid");
            txtEmailid.Text = y.Text;
            Label mo = (Label)row.FindControl("lblMobile");
            txtMobile.Text = mo.Text;
            Label st = (Label)row.FindControl("Examname");
            string s = Convert.ToString(st.Text);
            HiddenField hdExamID = (HiddenField)row.FindControl("hdExamID");
            if (hdExamID.Value != "")
            {
                ddlDesignation.SelectedValue = hdExamID.Value;
            }
           Label address = (Label)row.FindControl("Gender");
           if(address.Text=="Male")
            {
                radiogender.SelectedIndex = 0;
            }
            else
            {
                radiogender.SelectedIndex = 1;
            }

        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    
    {
        try
        {
            txtAddress.Text = txtAddress.Text.Trim().Replace("'", "\"");
            if ((ddlDesignation.SelectedIndex == 0) || (ddlDesignation.SelectedItem.ToString() == "--Select--"))
            {
                lblupdate.Text = "<span style='color:red'>Please Select designation..</span>";
            }
            else
            {
                string s = ddlDesignation.SelectedItem.ToString();
                SqlConnection con = new SqlConnection(constring);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Users Set  Fname='" + txtFname.Text.Trim() + "',Lname='" + txtLname.Text.Trim() + "',Examname='" + s + "',Mobile=" + txtMobile.Text.Trim() + ",Gender='" + radiogender.SelectedItem.ToString() + "',Address='" + txtAddress.Text.Trim() + "',    Email='" + txtEmailid.Text.Trim() + "' where username='" + lblUser.Text.Trim() + "' ", con);
                int n = cmd.ExecuteNonQuery();
                con.Close();
                ddlbind("Active");
                this.panelEdit.Visible = false;
                lblupdate.Text = "<span style='color:green'>Updated Successfully.</span>";
                gvAdminusers.SelectedIndex = -1;       
            }
        }
        catch(Exception ex)
        {
            lblupdate.Text = "<span style='color:red'>Someone already has that Email id. Try another?</span>";
        
        }
        
    }
   protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {

            lblupdate.Text = "<span style='color:red'>Operation cancelled..</span>";
            panelEdit.Visible = false;
            gvAdminusers.SelectedIndex = -1;       
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }

    }
   protected void gvAdminusers_PageIndexChanging(object sender, GridViewPageEventArgs e)
   {
       try
       {
           if (Request.QueryString["Activeadmin"]=="Activeadmin")
           {
               lblupdate.Text = "";
               panelEdit.Visible = false;
               gvAdminusers.SelectedIndex = -1;
               ddlbind("Active");
               gvAdminusers.PageIndex = e.NewPageIndex;
               gvAdminusers.DataBind();
               gvAdminusers.HeaderRow.Cells[0].Text = "Action";
           }
           else
           {
               ddlbind("Inactive");
               gvAdminusers.PageIndex = e.NewPageIndex;
               gvAdminusers.DataBind();
            if (gvAdminusers.Rows.Count > 0)
               {
                   for (int i = 0; i < gvAdminusers.Rows.Count; i++)
                   {
                       gvAdminusers.Rows[i].Cells[0].Visible = false;
                       gvAdminusers.HeaderRow.Cells[0].Visible = false;
                   }
               }
           }

       }
       catch(Exception ex)
       {
           ex.Message.ToString();
       }
   }
   protected void gvAdminusers_RowCommand(object sender, GridViewCommandEventArgs e)
   {
       try
       {
           if (e.CommandName == "Activeadmin")
           {
               int i = Convert.ToInt32(e.CommandArgument);
               GridViewRow row=(GridViewRow)gvAdminusers.SelectedRow;
               Label l=(Label)gvAdminusers.Rows[i].FindControl("Username");
             
                SqlConnection connection = new SqlConnection(constring);
                connection.Open();
                SqlCommand cmd = new SqlCommand("update Users set Status='Active' where Username='" + (l.Text) + "'", connection);
                int result = cmd.ExecuteNonQuery();
                connection.Close();
                if (result>0)
                {
                    ddlbind("Inactive");
                }

             
           }
       }
       catch(Exception ex)
       {
           ex.Message.ToString();
       }
   }
}