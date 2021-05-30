using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
public partial class sendingstatus : System.Web.UI.Page
{
    string sentandneedtosent;
    string strmail = null;
    static 
      string rol;
    string arr;
    string s;
    DataTable dataset = new DataTable();
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
        try
        {

            if (!IsPostBack)
            {

                bindexamnamedetails();
                if (Convert.ToString(Session["Role"]) != "super")
                {
                    rol = Convert.ToString(Session["Examname"]);
                }
                else
                {
                    rol = "%";
                }
                needtosend();
            }
        }
       catch(Exception ex)
        {
            ex.Message.ToString();
        }
    }
    private void filtering()
    {
        try
        {
            gvStudentMarks.DataSource = null;
            gvStudentMarks.DataBind();
            SqlConnection connection = new SqlConnection(constring);

            if (txtDate.Text == "" & ddlexamname.SelectedIndex == 0 & txtAboveMarks.Text != "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate' from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and marks>" + Convert.ToInt32(txtAboveMarks.Text) + " and Examname like '" + rol + "' order by Examdate desc";
            }
            if (txtDate.Text == "" & ddlexamname.SelectedIndex != 0 & txtAboveMarks.Text == "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate'  from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and Examname='" + ddlexamname.SelectedItem.ToString() + "' and  Examname like '" + rol + "' order by Examdate desc";
            }
            if (txtDate.Text == "" & ddlexamname.SelectedIndex != 0 & txtAboveMarks.Text != "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate'  from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and  Examname='" + ddlexamname.SelectedItem.ToString() + "' and marks>" + Convert.ToInt32(txtAboveMarks.Text) + " and Examname like '" + rol + "' order by Examdate desc";
            }
            if (txtDate.Text != "" & ddlexamname.SelectedIndex == 0 & txtAboveMarks.Text == "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate'  from Users where  Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and Convert(date,LastLoginDate)='" + Convert.ToDateTime(txtDate.Text) + "' and Examname like '" + rol + "' order by Examdate desc";
            }
            if (txtDate.Text != "" & ddlexamname.SelectedIndex == 0 & txtAboveMarks.Text != "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate'  from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and convert(date,LastLoginDate)='" + Convert.ToDateTime(txtDate.Text).ToString("yyyy/MM/dd") + "'  and marks>" + Convert.ToInt32(txtAboveMarks.Text) + " and Examname like '" + rol + "' order by Examdate desc";
            }
            if (txtDate.Text != "" & ddlexamname.SelectedIndex != 0 & txtAboveMarks.Text == "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate'  from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and convert(date,LastLoginDate)='" + Convert.ToDateTime(txtDate.Text).ToString("yyyy/MM/dd") + "' and Examname='" + ddlexamname.SelectedItem.ToString() + "' and Examname like '" + rol + "' order by Examdate desc";
            }

            if (txtDate.Text != "" & ddlexamname.SelectedIndex != 0 & txtAboveMarks.Text != "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate'  from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and convert(date,LastLoginDate)='" + Convert.ToDateTime(txtDate.Text).ToString("yyyy/MM/dd") + "' and Examname='" + ddlexamname.SelectedItem.ToString() + "' and marks>" + Convert.ToInt32(txtAboveMarks.Text) + " and Examname like '" + rol + "' order by Examdate desc";
            }
            if (txtDate.Text == "" & ddlexamname.SelectedIndex == 0 & txtAboveMarks.Text == "")
            {
                s = "select (Fname+space(1)+Lname) as Name,Mobile,Email,Percentage,Branch,Qualification,Marks,Experience,convert(date, lastlogindate) as 'ExamDate' from users where Status='Completed' and Mailstatus='" + sentandneedtosent + "' and Result='Qualified' and Examname like '" + rol + "' order by Examdate desc";
            }
            SqlDataAdapter adapter = new SqlDataAdapter(s, connection);
            DataTable dataset = new DataTable();
            adapter.Fill(dataset);
            gvStudentMarks.DataSource = dataset;
            gvStudentMarks.DataBind();
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }

    }
    private void needtosend()
    {
        try
        {

            if (btnSendback.Visible == false)
            {
                sentandneedtosent = "Notsent";
            }
            else
            {
                sentandneedtosent = "sent";
            }
            filtering();
            if (gvStudentMarks.Rows.Count > 0)
            {
                chkAll.Visible = true;
                gvStudentMarks.Columns[0].Visible = true;
                gvStudentMarks.HeaderRow.Cells[0].Text = "Check";
                chkAll.Visible = true;
                tomails.Text = "To: ";
                panelbody.Visible = true;
                lblnorows.Text = "";
            }
            else
            {
                lblnorows.Text = "No students available.";
                tomails.Text = "";
                panelbody.Visible = false;
               
                chkAll.Visible = false;
            
            }
          
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }
    
    
    }
    private void bindexamnamedetails()
    {

        try
        {
            SqlConnection connection = new SqlConnection(constring);
            string constrings;
            if (Convert.ToString(Session["Role"]) != "super")
            {
                string role = Convert.ToString(Session["Examname"]);
                constrings = "Select Examname,Examid FROM Exampattern where Examname='" + role + "' order by Examname asc ";
            }
            else
            {
                constrings = "Select Examname,Examid FROM Exampattern";
            }
                        SqlCommand cmd = new SqlCommand(constrings, connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ddlexamname.DataSource = ds;
            ddlexamname.DataTextField = "Examname";
            ddlexamname.DataValueField = "Examid";
            ddlexamname.DataBind();
            ddlexamname.Items.Insert(0, new ListItem("--Select--", "0"));
      
        }

        catch (Exception ex)
        {
            ex.Message.ToString();
        }


       
    }    
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        
        try
        {

            txtTo.Text = "";
            if(chkAll.Checked==true)
            {
                chkAll.Checked = false;
            }
            if ((btnSendback.Visible == false & txtDate.Text.Trim() == "") | (btnSendback.Visible == false & txtAboveMarks.Text.Trim() != ""))
            {
                needtosend();
            }
            if ((btnSendback.Visible == true & txtDate.Text.Trim() == "") | (btnSendback.Visible == true & txtAboveMarks.Text.Trim() != ""))
            {
                sentmailsdetails();
            }
         
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }

    }
    protected void ddlexamname_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (btnSendback.Visible == false & txtDate.Text == "")
            {
                needtosend();

            }
            if (btnSendback.Visible == true & txtDate.Text.Trim() == "")
            {
                sentmailsdetails();
            }
            if (btnSendback.Visible == false & txtDate.Text.Trim() != "")
            {
                chkAll.Checked = false;
                dataset.Rows.Clear();
                needtosend();
            }
            if (btnSendback.Visible == true & txtDate.Text.Trim() != "")
            {
                chkAll.Checked = false;
                dataset.Rows.Clear();
                sentmailsdetails();
            }
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }

    }
    protected void chkAll_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            txtTo.Text = "";
            if (chkAll.Checked == true)
            {
                foreach (Control m in updatepanelsendingstatus.ContentTemplateContainer.Controls)
                {
                    if (m is GridView)
                    {
                        foreach (GridViewRow row in gvStudentMarks.Rows)
                        {
                            CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                            if (chk.Checked == false)
                            {
                                chk.Checked = true;
                            }
                        }
                    }
                }
                if (gvStudentMarks.Rows.Count > 0)
                {
                    foreach (GridViewRow gvrow in gvStudentMarks.Rows)
                    {
                        arr += gvrow.Cells[3].Text + ',';
                    }
                    arr = arr.Trim(",".ToCharArray());
                    txtTo.Text = arr;
                }
            }
            else
            {
                foreach (Control m in updatepanelsendingstatus.ContentTemplateContainer.Controls)
                {
                    if (m is GridView)
                    {
                        foreach (GridViewRow row in gvStudentMarks.Rows)
                        {
                            CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                            if (chk.Checked == true)
                            {
                                chk.Checked = false;
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnSendmail_Click(object sender, EventArgs e)
    {
        try
        {

            if (txtTo.Text == "")
            {
                lblnorows.Visible = true;
                lblnorows.Text = "Please select To Address";
            }
            else
            { 
                lblsuccess.Text = "Please wait Mail(s) is Sending...";
                string emailList = "msuresh551@gmail.com";
                MailMessage mail = new MailMessage("msuresh551@gmail.com", emailList, txtSubject.Text, txtBody.Text);
                string b = Convert.ToString(txtTo.Text);
                mail.Bcc.Add(b);
                SmtpClient clint = new SmtpClient("smtp.gmail.com");
                clint.Port = 587;
                clint.Credentials = new System.Net.NetworkCredential("msuresh551@gmail.com", "haimahesh123");
                clint.EnableSsl = true;
                clint.Send(mail);
                txtBody.Text = "";
                txtSubject.Text = "";
                 SqlConnection connection = new SqlConnection(constring);
                string s = txtTo.Text;
                string[] mails = s.Split(',');
                int i = mails.Length;
                string[] tosent = new string[100];
                for (int j = 0; j < i; j++)
                {
                    tosent[j] = mails[j];
                }
                for (int j = 0; j < i; j++)
                {
                    string exam = "Update Users set Mailstatus='sent'  WHERE  (Email ='" + tosent[j] + "')";
                    connection.Open();
                    SqlCommand cd = new SqlCommand(exam, connection);
                    int up = cd.ExecuteNonQuery();
                    connection.Close();

                }
                 lblsuccess.Text = "Mail has been Sent successfully..";
                txtTo.Text = "";
                needtosend();
            }
        }
        catch
        {
            lblsuccess.Visible = true;
            lblsuccess.Text = "<span color='red'>Please Fill Above Details</span>";
        }        
    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            int i = 0;           
            foreach (GridViewRow gvrow in gvStudentMarks.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
                if (chk != null & chk.Checked)

                {
                    i++;
                    strmail += gvrow.Cells[3].Text + ',';                    
                }
            }
            strmail = strmail.Trim(",".ToCharArray());
            txtTo.Text = strmail;
            if (gvStudentMarks.Rows.Count == i)
            {
                chkAll.Checked = true;
            }
            else 
            {
                chkAll.Checked = false;
            }
        }
        catch
        {
            txtTo.Text = "";
            chkAll.Checked = false;         
        }
    }
    protected void btnImg_Click(object sender, ImageClickEventArgs e)
    {
        if (calSelectdate.Visible == false)
        {
            calSelectdate.SelectedDates.Clear();
           calSelectdate.Visible = true;
       //     panelbody.Visible = false;
         }
        else
        {
            calSelectdate.Visible = false;
       //     panelbody.Visible = false;
         }
    }
    protected void calSelectdate_SelectionChanged(object sender, EventArgs e)
    {
         if (btnsent.Visible == true)
        {
            txtDate.Text = calSelectdate.SelectedDate.ToString("yyyy/MM/dd");
            this.calSelectdate.Visible = false;
            needtosend();
        }
        else
        {
            txtDate.Text = calSelectdate.SelectedDate.ToString("yyyy/MM/dd");
            calSelectdate.SelectedDate.AddDays(1);
            this.calSelectdate.Visible = false;
            sentmailsdetails();
        }
    }
    protected void  clearcontrols()
    {
        tomails.Text = "";           
        ddlexamname.SelectedIndex = 0;
        txtAboveMarks.Text = "";
        calSelectdate.Visible = false;
        gvStudentMarks.DataSource = null;
        gvStudentMarks.DataBind();
        lblnorows.Text = "";         
    }    
    protected void btnSendback_Click1(object sender, EventArgs e)
    {
        try
        {
            clearcontrols();
            txtDate.Text = "";
            tomails.Visible = true;
            panelbody.Visible = false;
            btnSendmail.Enabled = true;
            lblsend.Visible = true;
            lblsent.Visible = false;
            btnsent.Visible = true;
            this.btnSendback.Visible = false;
            needtosend();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnsent_Click(object sender, EventArgs e)
    {
        try
        {
            clearcontrols();
            txtDate.Text = "";
            panelbody.Visible = false;
            btnSendback.Visible = true;
            txtTo.Text = "";
            if(chkAll.Checked==true)
            {
               chkAll.Checked = false;
            }

            chkAll.Visible = false;
            btnsent.Visible = true;
            btnSendmail.Enabled = false;
            lblsent.Visible = true;
            lblsend.Visible = false;
            this.btnsent.Visible = false;
            sentmailsdetails();
            if (gvStudentMarks.Rows.Count > 0)
            {
                gvStudentMarks.Columns[0].Visible = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    private void sentmailsdetails()
    {
       
            try
            {
                sentandneedtosent = "sent";
                filtering();

                if (gvStudentMarks.Rows.Count > 0)
                {
                    lblnorows.Text = "";
                    gvStudentMarks.Columns[0].Visible = false;
                    chkAll.Visible = false;
                    tomails.Text = "";
                    panelbody.Visible = false;
                }
                else
                {
                    lblnorows.Text = "No students available.";
                }

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
    
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            chkAll.Checked = false;
            txtTo.Text = "";
            txtAboveMarks.Text = "";
            txtDate.Text = "";
            ddlexamname.SelectedIndex = 0;
            lblnorows.Text = "";
            if (btnSendback.Visible == false)
            {
                needtosend();

            }
            if (btnSendback.Visible == true)
            {
                sentmailsdetails();
            }
        }
      catch(Exception ex)
        {
            ex.Message.ToString();
        }

    }
    protected void gvStudentMarks_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            needtosend();
            gvStudentMarks.PageIndex = e.NewPageIndex;
            gvStudentMarks.DataBind();
            if (chkAll.Checked == true)
            {
                chkAll.Checked = false;
            }
            if (btnSendback.Visible == true)
            {
                if (gvStudentMarks.Rows.Count > 0)
                {
                    gvStudentMarks.Columns[0].Visible = false;
                    chkAll.Visible = false;
                    panelbody.Visible = false;
                    tomails.Text = "";
                }
            }
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }
      
        
    }


   
}