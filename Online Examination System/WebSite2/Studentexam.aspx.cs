using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class Studentexam : System.Web.UI.Page
{

    int totalmarks = 0;
    static int countquestion = 0;
    static int countrow = 0;
    public static DataTable table = null;
    static DataTable result = new DataTable();
    static int seconds = 0;
    static int minutes = 0;
    static int NumberofQuestions = 0;
    static int passmarks = 0;
    string examname;
    static string uname;
    string constring = ConfigurationManager.ConnectionStrings["con"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Username"] != null)
            {
                uname = Session["Username"].ToString();
                lblusername.Text = uname;
                if (!IsPostBack)
                {

                    if (Session["table"] == null)
                    {
                        table = null;
                        seconds = 0;
                        minutes = 0;
                    }
                    if (table == null)
                    {
                        srtbutton.Visible = true;
                        btnNextquestion.Visible = false;
                        btnfinish.Visible = false;
                        result.Columns.Clear();
                        result.Rows.Clear();
                        result.Columns.AddRange(new DataColumn[4] { new DataColumn("Questionkey", typeof(int)), new DataColumn("QuestionId", typeof(int)), new DataColumn("useranswer", typeof(string)), new DataColumn("Actualanswer", typeof(string)) });
                    }
                    else
                    {
                        int s = seconds;
                        int m = minutes;
                        srtbutton_Click(null, null);
                        seconds = s;
                        minutes = m;
                    }

                }
                if (IsPostBack)
                {
                    if (countquestion > (NumberofQuestions - 2))
                    {
                        btnNextquestion.Visible = false;
                        btnfinish.Visible = true;
                    }
                }
                if (countquestion < 1)
                {
                    btnPrevious.Visible = false;
                }
            }
            else
            {
                Response.Redirect("login.aspx", false);
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();

        }
    }
    protected void srtbutton_Click(object sender, EventArgs e)
    {
        try
        {

            btnlinksignout.Visible = false;
            totalmarks = 0;
            btnfinish.Visible = false;
            countrow = 0;
            countquestion = 0;
            result.Rows.Clear();
            using (SqlConnection connection = new SqlConnection(constring))
            {
                SqlDataReader dr;
                string exam = "SELECT  * FROM Exampattern WHERE  (Examname ='" + Convert.ToString(Session["Examname"]) + "')";
                connection.Open();
                SqlCommand cd = new SqlCommand(exam, connection);
                dr = cd.ExecuteReader();
                if (dr.Read())
                {
                    if (minutes == 0 & Session["table"] == null)
                    {
                        minutes = Convert.ToInt32(dr[2].ToString()) - 1;
                    }
                    NumberofQuestions = Convert.ToInt32(dr[4].ToString());
                    examname = dr[1].ToString();
                    passmarks = Convert.ToInt32(dr[3].ToString());
                }
                if (seconds == 0 & Session["table"] == null)
                {
                    seconds = 59;
                }
                connection.Close();
                connection.Open();
                string s = "SELECT TOP (" + NumberofQuestions + ") QuestionId, Examname, Question, Option1, Option2, Option3, Option4, Answer FROM Questions WHERE Status='Active' and Examname ='" + examname + "' ORDER BY NEWID()";
                SqlCommand cmd = new SqlCommand(s, connection);
                using (dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        table = new DataTable();
                        table.Load(dr);
                        Session["table"] = table;
                    }
                }
            }
            if (table == null)
            {
                lblQuestions.Visible = true;
                btnlinksignout.Visible = true;

            }
            else if (table.Rows.Count > 0)
            {
                if (table.Rows.Count == NumberofQuestions)
                {

                    lblQuestion.Text = "Q. " + (countquestion + 1) + " :" + table.Rows[countrow].ItemArray[2].ToString();
                    for (int i = 3; i <= 6; i++)
                    {
                        rblOptions.Items.Add(table.Rows[countrow].ItemArray[i].ToString());
                    }
                    lblMin.Visible = true;
                    lblSec.Visible = true;
                    Tset.Enabled = true;
                    btnNextquestion.Visible = true;
                }

                else
                {
                    lblerror.Visible = true;
                    lblerror.Text = "<span style='color:red'>Questions not Prepared Yet.....</span>";
                    btnlinksignout.Visible = true;
                }
            }
            else
            {
                lblerror.Visible = true;
                lblerror.Text = "Questions not Prepared Yet.....";

            }
            this.srtbutton.Visible = false;
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void btnNextquestion_Click(object sender, EventArgs e)
    {
        try
        {
            if (rblOptions.SelectedIndex != -1)
            {

            }
            if (countrow < (NumberofQuestions - 1))
            {
                lblQuestion.Text = "";
                rblOptions.Items.Clear();
                countquestion += 1;
                btnPrevious.Visible = true;
                countrow += 1;
                lblQuestion.Text = "Q. " + (countquestion + 1) + " :" + table.Rows[countrow].ItemArray[2].ToString();
                for (int i = 3; i <= 6; i++)
                {
                    rblOptions.Items.Add(table.Rows[countrow].ItemArray[i].ToString());
                }
                if (result.Rows.Count > 0)
                {
                    DataRow[] checkedprivious = result.Select("Questionkey ='" + (countrow) + "'");

                    foreach (DataRow row in checkedprivious)
                    {
                        rblOptions.SelectedValue = row[2].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = "you have less number of questions " + ex.ToString();
        }
    }
    protected void btnfinish_Click(object sender, EventArgs e)
    {
        try
        {
            finalmehthod();
            Session.RemoveAll();
            string msg = "Your Examcompleted thankq...";
            Response.Redirect("login.aspx?success=" + msg, false);
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.ToString();
        }
    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        try
        {
            if (countrow >= 1)
            {
                lblQuestion.Text = "";
                rblOptions.Items.Clear();
                countquestion -= 1;
                btnNextquestion.Visible = true;
                countrow -= 1;
                lblQuestion.Text = "Q. " + (countquestion + 1) + " :" + table.Rows[countrow].ItemArray[2].ToString();
                for (int i = 3; i <= 6; i++)
                {
                    rblOptions.Items.Add(table.Rows[countrow].ItemArray[i].ToString());
                }
                if (result.Rows.Count > 0)
                {
                    DataRow[] checkedprivious = result.Select("Questionkey ='" + (countrow) + "'");
                    foreach (DataRow row in checkedprivious)
                    {
                        rblOptions.SelectedValue = row[2].ToString();
                    }
                }
            }
            else
            {
                btnPrevious.Visible = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void rblOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (countquestion >= 0)
            {
                if (result.Select("Questionkey=" + countquestion + "").Length > 0)
                {
                    DataRow[] dr = new DataRow[1];
                    dr = result.Select("Questionkey=" + countquestion + "");
                    result.Rows.Remove(dr[0]);
                }
                result.Rows.Add(countquestion, Convert.ToInt32(table.Rows[countrow].ItemArray[0].ToString()), rblOptions.SelectedValue.ToString(), table.Rows[countrow].ItemArray[7].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Write("error" + ex.ToString());
        }
    }
    protected void Tset_Tick(object sender, EventArgs e)
    {
        try
        {
           if (minutes != 0 || seconds != 0)
            {
                if (seconds < 1)
                {
                    seconds = 59;
                    if (minutes == 0)
                    {
                    }
                    else
                    {
                        minutes -= 1;
                    }
                }
                else
                    seconds -= 1;
                lblMin.Text = minutes.ToString();
                lblSec.Text = " : " + seconds.ToString();
            }
            else
            {
                finalmehthod();
                Session.RemoveAll();
                string msg = "Your Examcompleted thankq...";
                Response.Redirect("login.aspx?success=" + msg, false);

            }

        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    private void finalmehthod()
    {
        try
        {
            for (int k = 0; k < result.Rows.Count; k++)
            {
                string useranswr = result.Rows[k][2].ToString();
                string cortanswr = result.Rows[k][3].ToString();
                if (useranswr == cortanswr)
                {
                    totalmarks++;
                }
                else
                {
                    continue;
                }
            }
            string status = string.Empty;
            if (totalmarks >= passmarks)
            {
                status = "Qualified";
            }
            else
            {
                status = "Notqualified";
            }

            string marks = "update users set Result='" + status + "',marks=" + totalmarks + ",Status='Completed',Mailstatus='Notsent' ,LastLoginDate='" + DateTime.Now.ToString() + "',Totalquestions=" + NumberofQuestions + " where Username='" + uname + "'";
            SqlConnection cn = new SqlConnection(constring);
            SqlCommand cd = new SqlCommand(marks, cn);
            cn.Open();
            {
                int up = cd.ExecuteNonQuery();
            }
            cn.Close();
            SqlDataAdapter a = new SqlDataAdapter("SELECT * FROM UserQuestions", cn);

            a.InsertCommand = new SqlCommand("insert into UserQuestions(Userid,Questionid,Useranswer,Actualanswer) values(" + Convert.ToString(Session["Userid"]) + ",@userQuestionId,@useranswer,@Actualanswer)", cn);
            a.InsertCommand.Parameters.Add("@userQuestionId", SqlDbType.Int, 15, "Questionid");
            a.InsertCommand.Parameters.Add("@useranswer", SqlDbType.NVarChar, 1500, "Useranswer");
            a.InsertCommand.Parameters.Add("@Actualanswer", SqlDbType.NVarChar, 1500, "Actualanswer");
            a.Fill(result);
            a.Update(result);
            countquestion = 0;
            countrow = 0;
            minutes = 0;
            seconds = 0;
            totalmarks = 0;
            NumberofQuestions = 0;
            examname = "";
            uname = "";
            rblOptions.Items.Clear();
            lblQuestion.Text = "";
            table.Rows.Clear();
            table = null;
            result.Rows.Clear();
        }
        catch (Exception ex)
        {

            ex.Message.ToString();
        }
    }
    protected void btnlinksignout_Click(object sender, EventArgs e)
    {
        try
        {
            totalmarks = 0;
            countquestion = 0;
            countrow = 0;
            table = null;
            result.Rows.Clear();
            seconds = 0;
            minutes = 0;
            NumberofQuestions = 0;
            Session.RemoveAll();
            Server.Transfer("login.aspx");
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}
