using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class AddQuestions : System.Web.UI.Page
{
   DataTable datatable = new DataTable();     
    string constring = ConfigurationManager.ConnectionStrings["con"].ToString();
    static int qid;
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

            if (Request.QueryString["Inactive"]=="Inactive")
            {
                if (!IsPostBack)
                {
                    UpdateQuestions.Visible = false;
                        Inactivebind();
                        ddlbindExam();
               
                }

            }
            else 
            {
                panelInactive.Visible = false;
                if (!IsPostBack)
                {
                    bindexamnamedetails();
                }
            }
        }

        catch (Exception ex)
        {
           ex.Message.ToString();
        }
    }
    private void Inactivebind()
    {
        try
        {
            string command;

            if (Convert.ToString(Session["Role"]) != "super")
            {
                string role = Convert.ToString(Session["Examname"]);

                command = "select Question,Option1,Option2,Option3,Option4,Answer,Questionid from Questions where Examname='" + role + "' and Status='Inactive' order by Question";
            }
            else
            {
                    command = "select Question,Option1,Option2,Option3,Option4,Answer,Questionid from Questions where Status='Inactive' order by Question";
           }
            SqlConnection connection = new SqlConnection(constring);
            SqlDataAdapter adapter = new SqlDataAdapter(command, connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            gvInaciveQuestions.DataSource = dataset;
            gvInaciveQuestions.DataBind();
            if (gvInaciveQuestions.Rows.Count > 0)
            {
                gvInaciveQuestions.Columns[7].Visible = false;
                lblinactivequestions.Text="Total Inactive Questions: "+Convert.ToString(dataset.Tables[0].Rows.Count);
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
            connection.Open();
            string constrings;
            if (Convert.ToString(Session["Role"]) != "super")
            {
                hide.Visible = false;
                string role = Convert.ToString(Session["Examname"]);
                constrings = "Select Examname,Examid FROM Exampattern where Examname='" + role + "' order by Examname ";
            }
            else
            {
                constrings = "Select Examname,Examid FROM Exampattern";
            }

            SqlCommand cmd = new SqlCommand(constrings, connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);

          ddlSubject.DataSource = ds;
                ddlSubject.DataTextField = "Examname";
                ddlSubject.DataValueField = "Examid";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            connection.Close();
        }

        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }  
    private void ddlbindExam()
    {
        try
        {

            SqlConnection connection = new SqlConnection(constring);
            connection.Open();
            string constrings;
            if (Convert.ToString(Session["Role"]) != "super")
            {
                ddlExamnamehide.Visible = false;
                string role = Convert.ToString(Session["Examname"]);
                constrings = "Select Examname,Examid FROM Exampattern where Examname='" + role + "' ";
            }
            else
            {
                constrings = "Select Examname,Examid FROM Exampattern";
            }
            SqlCommand cmd = new SqlCommand(constrings, connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ddlbindExamnames.DataSource = ds;
            ddlbindExamnames.DataTextField = "Examname";
            ddlbindExamnames.DataBind();
            ddlbindExamnames.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }
       
    }
    protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection connection = new SqlConnection(constring);
            SqlDataAdapter adapter = new SqlDataAdapter("select Question,Option1,Option2,Option3,Option4,Answer,Questionid,Examname from Questions where Examname='" + ddlSubject.SelectedItem.ToString() + "' and Status='Active' order by Question", connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            gvShowQuestions.DataSource = dataset;
            gvShowQuestions.DataBind();
            lblError.Text= "";
            if (gvShowQuestions.Rows.Count == 0)
            {
                   clearcontrols();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }

    }
    protected void btnSubmitQuestion_Click(object sender, EventArgs e)
    {
        try
        {
             if ((txtOption1.Text.Trim().ToLower()) == Convert.ToString(txtQuestion.Text.Trim().ToLower()) | (txtOption1.Text.Trim().ToLower() == txtOption2.Text.Trim().ToLower()) | (txtOption1.Text.Trim().ToLower() == txtOption3.Text.Trim().ToLower()) || (txtOption1.Text.Trim().ToLower() == txtOption4.Text.Trim().ToLower()) || (txtOption2.Text.Trim().ToLower() == txtQuestion.Text.Trim().ToLower()) | (txtOption2.Text.Trim() == txtOption3.Text.Trim()) | (txtOption2.Text.Trim().ToLower() == txtOption4.Text.Trim().ToLower()) || (txtOption3.Text.Trim().ToLower() == txtOption4.Text.Trim().ToLower()) | (txtOption3.Text.Trim().ToLower() == txtQuestion.Text.Trim().ToLower()) | (txtOption4.Text.Trim().ToLower() == txtQuestion.Text.Trim().ToLower()))
            {               
                lblError.Text = "<span style='color: red;'>Options Should not be same</span>";
            }
            else if (ddlSubject.SelectedItem.ToString() == "--Select--")
            {
             
                lblError.Text = "<span style='color: red;'>Please select Exam Name..</span>";
            }
            else
            {
              
                string cleanString = System.Text.RegularExpressions.Regex.Replace(txtQuestion.Text.Trim(), @"\s+", " ");
                using (SqlConnection con = new SqlConnection(constring))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from Questions where Question='" + cleanString + "'", con);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        lblError.Text = "The current question is already exists";
                        return;
                    }
                    reader.Close();

                    txtQuestion.Text = txtQuestion.Text.Replace("'", "\"");
                   
                    txtOption1.Text = txtOption1.Text.Replace("'", "\"");
                    txtOption2.Text = txtOption2.Text.Replace("'", "\"");
                    txtOption3.Text = txtOption3.Text.Replace("'", "\"");
                    txtOption4.Text= txtOption4.Text.Replace("'", "\"");
                    
                    string Answer = "text";
                    int a = Convert.ToInt32(ddlsltAnswer.SelectedIndex.ToString());
                    switch (a)
                    {
                        case 1: Answer = txtOption1.Text;
                             break;
                        case 2: Answer = txtOption2.Text;
                            break;
                        case 3: Answer = txtOption3.Text;
                            break;
                        case 4: Answer = txtOption4.Text;
                            break;
                    }
                    
                    SqlCommand cmd1 = new SqlCommand("Insert into Questions(Examname,Question,Option1,Option2,Option3,Option4,Answer) values('" + ddlSubject.SelectedItem.ToString().Trim() + "','" + txtQuestion.Text.Trim() + "', '" + txtOption1.Text.Trim() + "' , '" + txtOption2.Text.Trim() + "','" + txtOption3.Text.Trim() + "','" + txtOption4.Text.Trim() + "','" + Answer.Trim() + "')", con);
                    int n = cmd1.ExecuteNonQuery();
                    con.Close();
                    if (n > 0)
                    {
                        clearcontrols();
                        gvbindddlselect();
                    }
                    else
                    {
                        lblError.Text = "Please try after some time.";
                    }
                }
            }
        }

        catch (Exception ex)
        {
            lblError.Text = ex.Message.ToString(); ;
        }
    }
    private void gvbindddlselect()
    {
        try
        {
            SqlConnection connection = new SqlConnection(constring);
            SqlDataAdapter adapter = new SqlDataAdapter("select * from Questions where Examname='" + ddlSubject.SelectedItem.ToString() + "' order by Question", connection);
            DataTable dataset = new DataTable();
            adapter.Fill(dataset);
            gvShowQuestions.DataSource = dataset;
            gvShowQuestions.DataBind();
            lblError.Text = "<span style='color:Green'>Saved Successfully..</span>";
            lblCurrent.Text = "<span style='color:green'>Total available Questions : " + dataset.Rows.Count;
           
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }   
    protected void gvShowQuestions_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            
           gvShowQuestions.SelectedRowStyle.CssClass = "selectedrow";
            lblError.Text = "";
            btnSubmitQuestion.Visible = false;
           btnUpdate.Visible = true;
            btnDelete.Visible = true;
            GridViewRow row = (GridViewRow)gvShowQuestions.SelectedRow;
            Label Question = (Label)row.FindControl("lblQuestion");
            string replace = Question.Text;
            txtQuestion.Text = replace.Replace("\"", "'");
            Label op1 = (Label)row.FindControl("lblOption1");
             txtOption1.Text = op1.Text.Replace("\"", "'");
            Label op2 = (Label)row.FindControl("lblOption2");
            string o2 = op2.Text;
            txtOption2.Text = o2.Replace("\"", "'");
            Label op3 = (Label)row.FindControl("lblOption3");
            string o3 = op3.Text;
            txtOption3.Text = o3.Replace("\"", "'");
           Label op4=(Label)row.FindControl("lblOption4");
           string o4 = op4.Text;
           txtOption4.Text = o4.Replace("\"", "'");
            Label answe = (Label)row.FindControl("lblAnswer");
            answe.Text = answe.Text.Replace("\"", "'");
       qid = Convert.ToInt32(gvShowQuestions.Rows[row.RowIndex].Cells[7].Text);
       
              var answer = answe.Text;
           if (answer == txtOption1.Text.Trim())
            {
                ddlsltAnswer.SelectedIndex = 1;
            }
            else if (answer == txtOption2.Text.Trim())
            {
                ddlsltAnswer.SelectedIndex = 2;
            }
           else if (answer == txtOption3.Text.Trim())
           {
               ddlsltAnswer.SelectedIndex = 3;
           }
           else if (answer == txtOption4.Text.Trim())
           {
               ddlsltAnswer.SelectedIndex = 4;
           }
           else
           {
               ddlsltAnswer.SelectedIndex = -1;
           }

        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {         

            if (txtOption1.Text.Trim().ToLower() == txtQuestion.Text.Trim().ToLower() || txtOption1.Text.Trim().ToLower() == txtOption2.Text.Trim().ToLower() || txtOption1.Text.Trim().ToLower() == txtOption3.Text.Trim().ToLower() || txtOption1.Text.Trim().ToLower() == txtOption4.Text.Trim().ToLower() || txtOption2.Text.Trim().ToLower() == txtQuestion.Text.Trim() || txtOption2.Text.Trim().ToLower() == txtOption3.Text.Trim().ToLower() || txtOption2.Text.Trim().ToLower() == txtOption4.Text.Trim().ToLower() || txtOption3.Text.Trim().ToLower() == txtOption4.Text.Trim().ToLower())
            {
               
                lblError.Text = "<span style='color: red;'>Options Should not be same";
            }
            else
            {
               txtQuestion.Text = System.Text.RegularExpressions.Regex.Replace(txtQuestion.Text.Trim(), @"\s+", " ");
           
                txtQuestion.Text = txtQuestion.Text.Replace("'", "\"");
                txtOption1.Text =txtOption1.Text.Replace("'", "\"");
                txtOption2.Text=txtOption2.Text.Replace("'","\"");
                txtOption3.Text =txtOption3.Text.Replace("'", "\"");
                txtOption4.Text = txtOption4.Text.Replace("'", "\"");    
                using (SqlConnection con = new SqlConnection(constring))
                {
                    string Answer = "text";
                    int a = Convert.ToInt32(ddlsltAnswer.SelectedIndex.ToString());
                    switch (a)
                    {
                        case 1: Answer = txtOption1.Text.Trim();
                            break;
                        case 2: Answer = txtOption2.Text.Trim();
                            break;
                        case 3: Answer = txtOption3.Text.Trim();
                            break;
                        case 4: Answer = txtOption4.Text.Trim();
                            break;
                    }
                    con.Open();
                    string s = "Update Questions Set Question='" + txtQuestion.Text.Trim() + "',Option1='" + txtOption1.Text.Trim() + "',Option2='" + txtOption2.Text.Trim() + "',Option3='" + txtOption3.Text.Trim() + "',Option4='" + txtOption4.Text.Trim() + "',Answer='" + Answer.Trim() + "' where QuestionId=" +qid;
                    SqlCommand cmd = new SqlCommand(s, con);
                    int n = cmd.ExecuteNonQuery();
                    con.Close();
                    if (n > 0)
                    {
                        gvShowQuestions.SelectedIndex = -1;
                        clearcontrols();
                        lblError.Text = "Updated successfully..";
                        SqlConnection connection = new SqlConnection(constring);
                        SqlDataAdapter adapter = new SqlDataAdapter("select Question,Option1,Option2,Option3,Option4,Answer,QuestionId,Examname from Questions where Examname='" + ddlSubject.SelectedItem.ToString() + "' and Status='Active' order by Question", connection);
                        adapter.Fill(datatable);
                        gvShowQuestions.DataSource = datatable;
                        gvShowQuestions.DataBind();
                        gvShowQuestions.HeaderRow.Cells[0].Text = "<span style='color:blue'>Select</span>";
                        lblCurrent.Text = "<span style='color:green'>Total available Questions : " + datatable.Rows.Count;
      
                             
                      
                    }
                    else
                    {
                        lblError.Text = "Recard is not Added";
                    }
                }
            }
        }

        catch (Exception ex)
        {
          lblError.Text = "<span style='color:red'>This Questions is Already Exists.</span>";
        }
        }
    private void clearcontrols()
    {
        try
        {
            lblCurrent.Text = "";
            lblSucess.Text = "";
            txtOption1.Text = "";
            txtOption2.Text = "";
            txtOption3.Text = "";
            txtOption4.Text = "";
            txtQuestion.Text = "";
            this.btnDelete.Visible = false;
            this.btnUpdate.Visible = false;          
            btnSubmitQuestion.Visible = true;
            ddlsltAnswer.SelectedIndex = -1;
            
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }

    }
    protected void ddlExamname_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlSubject.SelectedIndex == 0 || ddlSubject.SelectedItem.ToString() == "--Select--")
            {
                lblError.Text = "";
                clearcontrols();
                gvShowQuestions.DataSource = null;
                gvShowQuestions.DataBind();
             }
            else
            {
                gvShowQuestions.SelectedIndex = -1;
                 clearcontrols();
                  SqlConnection connection = new SqlConnection(constring);
                  SqlDataAdapter adapter = new SqlDataAdapter("select Question,Option1,Option2,Option3,Option4,Answer,QuestionId,Examname from Questions where Examname='" + ddlSubject.SelectedItem.ToString() + "' and Status='Active' order by Question", connection);
                 adapter.Fill(datatable);
                 gvShowQuestions.DataSource = datatable;
                 gvShowQuestions.DataBind();
          

                          lblError.Text = "";
                if (gvShowQuestions.Rows.Count == 0)
                {
                    lblinactivequestions.Text = "";
                    lblError.Text = "";
                    clearcontrols();
                 }
                else
                {
                    gvShowQuestions.HeaderRow.Cells[0].Text = "<span style='color:blue'>Select</span>";
                    lblCurrent.Text = "<span style='color:green'>Total available Questions :" + datatable.Rows.Count;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnAddSubject_Click(object sender, EventArgs e)
    {
        try
        {
            string cleanedString = System.Text.RegularExpressions.Regex.Replace(txtNewexam.Text.Trim(), @"\s+", " ");
           
            lblCurrent.Text = "";
            int Examid = 0;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Exampattern"))
                {
                    int NOFQ = 0, TIME = 0, MARKS = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Examname", cleanedString);
                    cmd.Parameters.AddWithValue("@NumberofQuestions", NOFQ);
                    cmd.Parameters.AddWithValue("@Time", TIME);
                    cmd.Parameters.AddWithValue("@Passmarks", MARKS);
                    cmd.Connection = con;
                    con.Open();
                    Examid = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                 }
                switch (Examid)
                {
                    case -1:
                        lblSucess.Visible = true;
                        lblSucess.Text = "Examname is exists..";
                        break;
                      default:
                        lblSucess.Visible = true;
                        lblSucess.Text = "Saved successfully";
                        break;
                }
                if (lblSucess.Text == "Saved successfully")
                {
                    ddlSubject.Items.Clear();
                    bindexamnamedetails();
                    txtNewexam.Text = "";
                    clearcontrols();
                    gvShowQuestions.DataSource = null;
                    gvShowQuestions.DataBind();
                    lblSucess.Text = "Saved successfully";
            
                }
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gvShowQuestions_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvShowQuestions.SelectedIndex = -1;
            clearcontrols();
            SqlConnection connection = new SqlConnection(constring);
            SqlDataAdapter adapter = new SqlDataAdapter("select Question,Option1,Option2,Option3,Option4,Answer,QuestionId,Examname from Questions where Examname='" + ddlSubject.SelectedItem.ToString() + "' and Status='Active' order by Question", connection);
            adapter.Fill(datatable);
            gvShowQuestions.DataSource = datatable;          
            gvShowQuestions.PageIndex = e.NewPageIndex;
            gvShowQuestions.DataBind();
            if (gvShowQuestions.Rows.Count != 0)
            {
                gvShowQuestions.HeaderRow.Cells[0].Text = "<span style='color:blue'>Select</span>";
                lblCurrent.Text = "Total available Questions : " + datatable.Rows.Count;
            }

        }
        catch(Exception ex)
        {
            ex.Message.ToString();
        }
    }   
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Questions Set Status='Inactive' where QuestionId=" + qid, con);
                int n = cmd.ExecuteNonQuery();
                con.Close();
                if (n > 0)
                {
                    gvShowQuestions.SelectedIndex = -1;
                    clearcontrols();
                    lblError.Text = "Deleted successfully..";
                    SqlConnection connection = new SqlConnection(constring);
                    SqlDataAdapter adapter = new SqlDataAdapter("select Question,Option1,Option2,Option3,Option4,Answer,QuestionId,Examname from Questions where Examname='" + ddlSubject.SelectedItem.ToString() + "' and Status='Active' order by Question", connection);
                    adapter.Fill(datatable);
                    gvShowQuestions.DataSource = datatable;
                    gvShowQuestions.DataBind();
                    lblCurrent.Text = "<span style='color:green'>Total available Questions : " + datatable.Rows.Count;
                    gvShowQuestions.HeaderRow.Cells[0].Text = "<span style='color:blue'>Select</span>";
         
                }
                else
                {
                    lblError.Text = "Recard is not Deleted";
                }
            }
           }

        catch (Exception ex)
        {
            lblError.Text = ex.ToString();
        }
    }
    protected void gvInaciveQuestions_RowCommand1(object sender, GridViewCommandEventArgs e)
      {
          try
          {
              if (e.CommandName == "GenerateExecutive")
              {

                  int index = Convert.ToInt32(e.CommandArgument.ToString());
                  GridViewRow selectedRow = (GridViewRow)gvInaciveQuestions.SelectedRow;
                  Label l = (Label)gvInaciveQuestions.Rows[index].FindControl("lblQuestionid");
                  int questionid = Convert.ToInt32(l.Text);
                  int n;
                  using (SqlConnection con = new SqlConnection(constring))
                  {
                      con.Open();
                      SqlCommand cmd = new SqlCommand("Update Questions Set Status='Active' where QuestionId=" + questionid, con);
                      n = cmd.ExecuteNonQuery();
                      con.Close();
                  }
                  
                      Inactivebind();
                      ddlbindExamnames.SelectedIndex = 0;

              }
                }
          catch(Exception ex)
          {
              ex.Message.ToString();
          }

      }
    private void retrive()
     {
         try
         {
             SqlConnection connection = new SqlConnection(constring);
             string s;
             s = "select Question,Option1,Option2,Option3,Option4,Answer,QuestionId,Examname from Questions where Examname='" + ddlbindExamnames.SelectedItem.ToString() + "' and Status='Inactive' order by Question";
             SqlDataAdapter adapter = new SqlDataAdapter(s, connection);
             DataSet dataset = new DataSet();
             adapter.Fill(dataset);
             gvShowQuestions.DataSource = dataset;
             gvShowQuestions.DataBind();
         }
         catch(Exception ex)
         {
             ex.Message.ToString();
         }
     }
    protected void gvInaciveQuestions_PageIndexChanging(object sender, GridViewPageEventArgs e)
      {
          try
          {
              Inactivebind();
              //gvShowQuestions.HeaderRow.Cells[0].Text = "<span style='color:blue'>Select</span>";
              gvInaciveQuestions.PageIndex = e.NewPageIndex;
              gvInaciveQuestions.DataBind();
            
          }
          catch(Exception ex)
          {
              ex.Message.ToString();
          }
      }
    protected void ddlbindExamnames_SelectedIndexChanged(object sender, EventArgs e)
      {
          try
          {
              string command;
              if (ddlbindExamnames.SelectedItem.ToString() != "--Select--")
              {
              command  = "select Question,Option1,Option2,Option3,Option4,Answer,Questionid from Questions where Examname='" + ddlbindExamnames.SelectedItem.ToString() + "' and Status='Inactive' order by Question";
                                SqlConnection connection = new SqlConnection(constring);
                  SqlDataAdapter adapter = new SqlDataAdapter(command, connection);
                  DataSet dataset = new DataSet();
                  adapter.Fill(dataset);
                  gvInaciveQuestions.DataSource = dataset;
                  gvInaciveQuestions.DataBind();
                  if (gvInaciveQuestions.Rows.Count > 0)
                  {
                      gvInaciveQuestions.Columns[7].Visible = false;
                      lblinactivequestions.Text = "Total Number of Questins in " + ddlbindExamnames.SelectedItem.ToString() + " : " + dataset.Tables[0].Rows.Count + "";
                  }
                  else
                  {
                      lblinactivequestions.Text = "";
                  }
              }
              else
              {
                  Inactivebind();

              }
          }
          catch(Exception ex)
          {
              ex.Message.ToString();
          }

      }

    
}