using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class students : System.Web.UI.Page
{
    string s;
    DataTable dtstudents = new DataTable();
    string rol;
    string connection = ConfigurationManager.ConnectionStrings["con"].ToString();

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
        try
        {
            if (Convert.ToString(Session["Role"]) != "super")
            {
                rol = Convert.ToString(Session["Examname"]);
            }
            else
            {
                rol = "%";
            }
            if (!IsPostBack)
            {
                bindexamnamedetails();
                gvbind();
                lblnorows.Text = "<span style='color:green;font-weight:bold;'> Total number of students Registered : " + dtstudents.Rows.Count + "</span>";
            }
        }
        catch(Exception ex)
        {
            lblnorows.Text = ex.Message.ToString();
                
        }

        //gvbind();
     
    }
    private void bindexamnamedetails()
    {
        try
        {
            SqlConnection con = new SqlConnection(connection);
            string constrings;
            if (Convert.ToString(Session["Role"]) != "super")
            {
                string role = Convert.ToString(Session["Examname"]);
                constrings = "Select Examname,Examid FROM Exampattern where Examname='" + role + "' ";
            }
            else
            {
                constrings = "Select Examname,Examid FROM Exampattern";
            }
            SqlCommand cmd = new SqlCommand(constrings, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ddlExamname.DataSource = ds;
            ddlExamname.DataTextField = "Examname";
            ddlExamname.DataValueField = "Examid";
            ddlExamname.DataBind();
            ddlExamname.Items.Insert(0, new ListItem("--Select--", "0"));

        }
        catch (Exception ex)
        {
            lblnorows.Text= ex.Message.ToString();
        }
    }

    private void gvbind()
    {
        try
        {
            if (txtUsername.Text == "" && ddlExamname.SelectedIndex == 0 | ddlExamname.SelectedIndex == -1 )
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Examname like '" + rol + "' order by username";
            }
          else if (txtUsername.Text == "" && ddlExamname.SelectedIndex != 0 && ddlExamname.SelectedIndex != -1 )
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Examname='" + ddlExamname.SelectedItem.ToString() + "' order by username";
            }
           else if (txtUsername.Text != "" && ddlExamname.SelectedIndex == 0)
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Username='" + txtUsername.Text.Trim() + "' and Examname like '" + rol + "' order by username";
            }
           else if(ddlExamname.SelectedIndex !=0 && txtUsername.Text!="")
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Username='" + txtUsername.Text.Trim() + "' and Examname='" + ddlExamname.SelectedItem.ToString() + "' order by username";
            }
        
            SqlConnection con = new SqlConnection(connection);
            SqlDataAdapter ad = new SqlDataAdapter(s, con);

            ad.Fill(dtstudents);
            studentdetails.DataSource = dtstudents;
            studentdetails.DataBind();
            if (studentdetails.Rows.Count == 0)
            {
                lblnorows.Text = "No Data is Available";
            }
            else
            {
                lblnorows.Text = "<span style='color:green'>Number of Students :" + dtstudents.Rows.Count + "</span>";
   
            }
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ddlUserstatus.SelectedValue = "--Select--";
        //ddlExamname.SelectedIndex = 0;
        studentdetails.DataSource = null;
        studentdetails.DataBind();
        gvbind();
      
    }
    protected void ddlExamname_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlUserstatus.SelectedValue = "--Select--";
            txtUsername.Text = "";
            studentdetails.DataSource = null;
            studentdetails.DataBind();
            gvbind();
            if (dtstudents.Rows.Count > 0)
            {
                lblnorows.Text = "<span style='color:green'>Number of Students :" + dtstudents.Rows.Count + "</span>";
            }
            if (ddlExamname.SelectedIndex == 0)
            {
                lblnorows.Text = "";
            }
        }
        catch(Exception ex)
        {
            lblnorows.Text = ex.Message.ToString();
        }

    }
    protected void studentdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvbind();
       studentdetails.PageIndex = e.NewPageIndex;
       studentdetails.DataBind();

    }
    protected void ddlUserstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            txtUsername.Text = "";
            studentdetails.DataSource = null;
            studentdetails.DataBind();
            
            if (ddlExamname.SelectedIndex == 0  && ddlUserstatus.SelectedValue=="--Select--")
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Examname like '" + rol + "' order by username";
            }
             else if(ddlExamname.SelectedIndex!=0 && ddlUserstatus.SelectedValue=="--Select--")
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Examname like '" + rol + "' and Examname='"+ddlExamname.SelectedItem.ToString()+"' order by username";
            }
            else if (ddlExamname.SelectedIndex == 0 && ddlUserstatus.SelectedValue!="--Select--")
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Examname like '" + rol + "' and result='" + ddlUserstatus.SelectedValue.ToString() +"' order by username";
            }
            else if(ddlExamname.SelectedIndex !=0 && ddlUserstatus.SelectedValue !="--Select--")
            {
                s = "select Username,Email,(Fname+space(1)+Lname) as Fullname,Mobile,Status as 'Exam Status',Gender,Qualification,Branch,Examname,Experience,Convert(date,CreatedDate) as 'Registered Date',Convert(date,LastLoginDate) as 'Exam Date',Marks,Yearofpass,Fathername,Result,Mailstatus from Users where role='user' and Examname like '" + rol + "' and result='" + ddlUserstatus.SelectedValue.ToString() + "' and Examname='"+ddlExamname.SelectedItem.ToString()+"' order by username";
            
            }
         
            SqlConnection con = new SqlConnection(connection);
            SqlDataAdapter ad = new SqlDataAdapter(s, con);

            ad.Fill(dtstudents);
            studentdetails.DataSource = dtstudents;
            studentdetails.DataBind();
            if (studentdetails.Rows.Count == 0)
            {
                lblnorows.Text = "No Data is Available";
            }
            else
            {
                if (ddlUserstatus.SelectedValue.ToString() != "--Select--")
                {
                    lblnorows.Text = "<span style='color:green'>Number of Students " + ddlUserstatus.SelectedValue.ToString() + " :" + dtstudents.Rows.Count + "</span>";
                }
                else
                {
                    lblnorows.Text = "<span style='color:green'>Number of Students :" + dtstudents.Rows.Count + "</span>";
                }
            }
        }
        catch (Exception ex)
        {
            lblnorows.Text = ex.Message.ToString();
        }
    }
}