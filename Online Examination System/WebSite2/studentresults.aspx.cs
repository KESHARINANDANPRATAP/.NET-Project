using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class studentresults : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["con"].ToString();
    DataTable subjects = new DataTable();
    static string s;
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
                Bindstudentdata();
                stdetails.Visible = false;
                stExampaper.Visible = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
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
                string role = Convert.ToString(Session["Examname"]);
                constrings = "Select Examname,Examid FROM Exampattern where Examname='" + role + "' order by Examname";
                Examname.Visible = false;
            }
            else
            {
                    constrings = "Select Examname,Examid FROM Exampattern order by Examname";
                
            }

            SqlCommand cmd = new SqlCommand(constrings, connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ddlSelectExamname.DataSource = ds;
            ddlSelectExamname.DataTextField = "Examname";
            ddlSelectExamname.DataValueField = "Examid";
            ddlSelectExamname.DataBind();
            ddlSelectExamname.Items.Insert(0, new ListItem("--Select--", "0"));
            connection.Close();

        }

        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    private void Bindstudentdata()
    {
        try
        {
            SqlConnection connection = new SqlConnection(constring);
            subjects.Rows.Clear();
            if (Convert.ToString(Session["Role"]) != "super")
            { 
                SqlDataAdapter adapter = new SqlDataAdapter("select Userid,Username from Users where Role='user'and Status='Completed' and Examname='"+Convert.ToString(Session["Examname"])+"'", connection);
                adapter.Fill(subjects);
            }
             
            else
            {

                if (ddlSelectExamname.SelectedItem.ToString() == "--Select--" | ddlSelectExamname.SelectedIndex == 0)
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("select Userid,Username from Users where Role='user'and Status='Completed' order by Username", connection);
                    adapter.Fill(subjects);
                }
                else
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("select Userid,Username from Users where Role='user' and status='completed' and Examname='" + ddlSelectExamname.SelectedItem.ToString() + "' order by Username", connection);
                    adapter.Fill(subjects);
                }
              
            }
                ddlUsers.DataSource = subjects;
                ddlUsers.DataTextField = "Username";
                ddlUsers.DataValueField = "Userid";
                ddlUsers.DataBind();
                ddlUsers.Items.Insert(0, new ListItem("--Select Username--", "0"));  
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }

    }
  
    private void gvExampatternShow()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                SqlDataAdapter da = new SqlDataAdapter(s, con);
                da.Fill(subjects);
                gvStudentresults.DataSource = subjects;
                gvStudentresults.DataBind();
             }
            if (gvStudentresults.Rows.Count > 0)
            {
                lbltext.Text = "<span style='color:green'>Number of Question Attempted: </span> " + subjects.Rows.Count + "";
                int c = 0, w = 0;
                for (int j = 0; j < subjects.Rows.Count; j++)
                {
                    if (subjects.Rows[j].ItemArray[3].ToString() == "Correct")
                    {
                        c++;
                    }
                    else
                    {
                        w++;
                    }
                }
                imgRight.Visible = true;
                imgWrong.Visible = true;
                lblCorrect.Text = c.ToString();
                lblWrong.Text = w.ToString();
              
            }
            else
            {      
                lbltotquestions.Text="";
                lblnoofquestions.Text = "";         
                lblWrong.Text = "";
                lblCorrect.Text = "";
                imgRight.Visible = false;
                imgWrong.Visible = false;
                lbltext.Text = "<span style='color:red'>Not Attempted...</span>";
            }

            StudentDetails();

        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());            
        }

    }

    private void StudentDetails()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                subjects.Columns.Clear();
                subjects.Rows.Clear();
                string noofquest;
                if (txtenteruser.Text == "")
                {
                    s = "select (fname+SPACE(1)+lname) as 'Full name',Email,Mobile,Gender,Address,Percentage,Examname,Yearofpass,Qualification,Branch as Course,Experience,Result,Mailstatus from Users where UserId=" + Convert.ToInt32(ddlUsers.Text) + "";
                    noofquest = "select Totalquestions from users where Userid=" + Convert.ToInt32(ddlUsers.Text) + "";
                }
                else
                {
                    s = "select (fname+SPACE(1)+lname) as 'Full name',Email,Mobile,Gender,Address,Percentage,Examname,Yearofpass,Qualification,Branch as Course,Experience,Result,Mailstatus from Users where Username='" + txtenteruser.Text.Trim() + "'";
                    noofquest = "select Totalquestions from users where Username='" + txtenteruser.Text.Trim() + "'";

                }

                SqlDataAdapter das = new SqlDataAdapter(s, con);
                das.Fill(subjects);
                gvStudentDetails.DataSource = subjects;
                gvStudentDetails.DataBind();
                int noofquestions;
                con.Open();
                SqlCommand cmd = new SqlCommand(noofquest, con);
                noofquestions = Convert.ToInt32(cmd.ExecuteScalar());
                lbltotquestions.Text = "Total Questions given: ";
                lblnoofquestions.Text = noofquestions.ToString();
            }
        }
        catch(Exception ex)
        {
            ex.Message.ToString();

        }
    }
   protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            ddlUsers.SelectedIndex = -1;
            ddlSelectExamname.SelectedIndex = -1;
            imgRight.Visible = false;
            imgWrong.Visible = false;
            lbltotquestions.Text = "";
            lblnoofquestions.Text = "";
            lblCorrect.Text = "";
            lblWrong.Text = "";
            gvStudentDetails.DataSource = null;
           gvStudentDetails.DataBind();
           gvStudentresults.DataSource = null;
           gvStudentresults.DataBind();
            lbltext.Text = "";
            lblnotfond.Text = "";
            int i=0;
            using (SqlConnection con = new SqlConnection(constring))
            {
                con.Open();
                string constrin;
                if (Convert.ToString(Session["Role"]) != "super")
                {
                    constrin = "select count(*) from Users where Username='" + txtenteruser.Text.Trim() + "' and Examname='" + Convert.ToString(Session["Examname"]) + "' and status='Completed' ";
                }
                else
                { 
                    constrin="select count(*) from Users where Username='" + txtenteruser.Text.Trim() + "' and status='Completed'";
                }
                SqlCommand cmd = new SqlCommand(constrin, con); 
                i = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                

            }
            if (i == 0)
            {
                lblnotfond.Text = "Username is not Exists.";
                // bindexamnamedetails();
                stdetails.Visible = false;
                stExampaper.Visible = false;

            }
            else
            {
                s = "SELECT     q.Question, u.Useranswer as 'Selected Answer', q.Answer as 'Correct Answer', (CASE WHEN u.Useranswer = q.Answer THEN 'Correct' ELSE 'Wrong' END) AS Conclusion, q.Option1,q.Option2,q.Option3,q.Option4 fROM  Questions AS q INNER JOIN    UserQuestions AS u ON q.QuestionId = u.Questionid INNER JOIN   Users ON u.Userid = Users.UserId WHERE     (Users.Username='" + txtenteruser.Text.Trim() + "')  order by q.Question asc";
                gvExampatternShow();
                StudentDetails();
               stdetails.Visible = true;
                stExampaper.Visible = true;

            }
            Bindstudentdata();
         
          
        }

        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
   protected void ddlSelectExamname_SelectedIndexChanged(object sender, EventArgs e)
   {
       try
       {

           stdetails.Visible = false;
           stExampaper.Visible = false;
           lblnotfond.Text = "";
           lbltotquestions.Text = "";
           lblnoofquestions.Text = "";
           txtenteruser.Text = "";
           imgWrong.Visible = false;
           imgRight.Visible = false;
           lbltext.Text = "";
           lblCorrect.Text = "";
           lblWrong.Text = "";
           gvStudentresults.DataSource = null;
           gvStudentresults.DataBind();
           gvStudentDetails.DataSource = null;
           gvStudentDetails.DataBind();

           Bindstudentdata();
       }
       catch (Exception ex)
       {
           ex.Message.ToString();
       }
        
   }
   protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
   {
       try
       {

           stdetails.Visible = false;
           stExampaper.Visible = false;
           lbltotquestions.Text = "";
           lblnoofquestions.Text = "";
           lblnotfond.Text = "";
           txtenteruser.Text = "";
           if (ddlUsers.SelectedIndex == 0)
           {
               imgWrong.Visible = false;
               imgRight.Visible = false;
               lbltext.Text = " ";
               lblCorrect.Text = "";
               lblWrong.Text = "";
               gvStudentresults.DataSource = null;
               gvStudentresults.DataBind();
               gvStudentDetails.DataSource = null;
               gvStudentDetails.DataBind();
           }
           else
           {
               gvStudentresults.DataSource = null;
               gvStudentresults.DataBind();
               gvStudentDetails.DataSource = null;
               gvStudentDetails.DataBind();
               s = "SELECT  q.Question ,u.Useranswer as 'Selected Answer',q.Answer 'Correct Answer',(case when u.Useranswer=u.Actualanswer then 'Correct' else 'Wrong' end) as 'Conclusion',q.Option1,q.Option2,q.Option3,q.Option4 FROM    Questions q JOIN        UserQuestions u ON q.QuestionId = u.Questionid		where u.Userid=" + Convert.ToInt32(ddlUsers.Text) + " order by q.Question";

               stdetails.Visible = true;
               stExampaper.Visible = true;
               gvExampatternShow();
           }
       }
       catch (Exception ex)
       {
           Response.Write(ex.ToString());
       }

   }
   protected void gvStudentresults_PageIndexChanging(object sender, GridViewPageEventArgs e)
   {
       try
       {
           if (txtenteruser.Text != "")
           {
               s = "SELECT     q.Question, u.Useranswer as 'Selected Answer', q.Answer as 'Correct Answer', (CASE WHEN u.Useranswer = q.Answer THEN 'Correct' ELSE 'Wrong' END) AS Conclusion, Users.Username, Users.UserId fROM  Questions AS q INNER JOIN    UserQuestions AS u ON q.QuestionId = u.Questionid INNER JOIN   Users ON u.Userid = Users.UserId WHERE     (Users.Username ='" + txtenteruser.Text.Trim() + "') order by q.Question";

           }
           else
           {
               s = "SELECT  q.Question,u.Useranswer as 'Selected Answer',q.Answer as 'Correct Answer',(case when u.Useranswer=u.Actualanswer then 'Correct' else 'Wrong' end) as 'Conclusion' FROM    Questions q JOIN        UserQuestions u ON q.QuestionId = u.Questionid		where u.Userid=" + Convert.ToInt32(ddlUsers.Text) + " order by q.Question";
           }
           using (SqlConnection con = new SqlConnection(constring))
           {
               SqlDataAdapter da = new SqlDataAdapter(s, con);
               da.Fill(subjects);
               gvStudentresults.DataSource = subjects;
               gvStudentresults.DataBind();
           }
           gvStudentresults.PageIndex = e.NewPageIndex;
           gvStudentresults.DataBind();
       }
       catch(Exception ex)
       {
           ex.Message.ToString();
       }
   }
}