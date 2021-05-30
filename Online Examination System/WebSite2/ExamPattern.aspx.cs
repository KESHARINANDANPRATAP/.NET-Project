using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class ExamPattern : System.Web.UI.Page
{
     static int qid;
     static int i;
     string s;
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
        gvExampatternShow();

    }
    private void gvExampatternShow()
    {
        try
        {

            if (Convert.ToString(Session["Role"]) != "super")
            {
                

                using (SqlConnection con = new SqlConnection(constring))
                {
                    string role = Convert.ToString(Session["Examname"]);
                   s = "SELECT * FROM Exampattern E WHERE E.Examname in(select q.Examname from questions q where q.Status like 'Active' group by q.Examname having count(q.examname)>=10) and E.Examname='" + role + "' order by E.Examid ";
                    SqlDataAdapter da = new SqlDataAdapter(s, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Exampattern");
                    gvExamPattern.DataSource = ds.Tables["Exampattern"];
                    gvExamPattern.DataBind();
                    if (gvExamPattern.Rows.Count > 0)
                    {
                        gvExamPattern.HeaderRow.Cells[0].Text = "Select";
                    }

                }
            }
            else
            {
                using (SqlConnection con = new SqlConnection(constring))
                {
                    string s="SELECT * FROM Exampattern E WHERE E.Examname in(select q.Examname from questions q where q.Status like 'Active' group by q.Examname having count(q.examname)>=10) and E.Examname like '%' order by E.Examid ";
                    SqlDataAdapter da = new SqlDataAdapter(s, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Exampattern");
                    gvExamPattern.DataSource = ds.Tables["Exampattern"];
                    gvExamPattern.DataBind();
                    if (gvExamPattern.Rows.Count > 0)
                    {
                        gvExamPattern.HeaderRow.Cells[0].Text = "Select";
                    }

                }
            }
        }

        catch (Exception ex)
        {
            ex.Message.ToString();
        }
        
    }
    protected void gvExamPattern_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {



            gvExamPattern.SelectedRowStyle.CssClass = "selectedrow";
                    GridViewRow row = (GridViewRow)gvExamPattern.SelectedRow;
            qid = Convert.ToInt32(gvExamPattern.Rows[row.RowIndex].Cells[1].Text);
            Label tx = (Label)row.FindControl("lblExamname");
            lblLabel.Text = tx.Text;
            Label time = (Label)row.FindControl("lblTime");
            txtTime.Text = time.Text;
            Label pmarks = (Label)row.FindControl("PassMarks");
            txtPmarks.Text = pmarks.Text;
            Label nquestions = (Label)row.FindControl("lblNoofQuestions");
            txtNoofQuestions.Text = nquestions.Text;
            Panel1.Visible = true;
             btnEdit.Visible = true;
             Cancel.Visible = true;
            lblNew.Text = "Name of Exam";
            SqlConnection con = new SqlConnection(constring);
            string s = "select COUNT(QuestionId) from Questions  where Examname='" + Convert.ToString(tx.Text) + "' and Status='Active'";
            SqlCommand cd = new SqlCommand(s, con);
            con.Open();
            i = Convert.ToInt32(cd.ExecuteScalar());
            lblshowcurrentqu.Text = "Available Questions " + i;

        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {

              if (Convert.ToInt32(txtNoofQuestions.Text.Trim()) > i)
            {
                lblshowcurrentqu.Text = "<span style=color:red>Number of Questions Should not be more than available Questions</span>(" + i + ")";
            }
              else if (Convert.ToInt32(txtNoofQuestions.Text.Trim()) < 10)
              {
                  lblshowcurrentqu.Text = "<span style=color:red>Number of Questions should be more then 9.</span>";
              }
              else   if (Convert.ToInt32(txtTime.Text.Trim()) > (Convert.ToInt32(txtNoofQuestions.Text.Trim()) * 2))
            {
                lblshowcurrentqu.Text = "<span style=color:red> Total Time Duration should not more then  "+(Convert.ToInt32(txtNoofQuestions.Text.Trim())*2)+" Minutes</span>";
            }
            else if (Convert.ToInt32(txtTime.Text.Trim()) == 0 & (Convert.ToInt32(txtNoofQuestions.Text.Trim()) > 0))
            {
                lblshowcurrentqu.Text = "<span style=color:red>Total Time Duration Should not be zero.</span>";
            }
             else if ((0.33*Convert.ToDouble(txtNoofQuestions.Text)>Convert.ToDouble(txtTime.Text) ))
              {
                  double timeinminutes=Math.Ceiling(0.33*Convert.ToDouble(txtNoofQuestions.Text));
                  lblshowcurrentqu.Text = "<span style=color:red>Total Time Duration at least " + timeinminutes + " Minutes</span>";
              }
            else if (Convert.ToInt32(txtNoofQuestions.Text.Trim()) < Convert.ToInt32(txtPmarks.Text.Trim()))
            {
                lblshowcurrentqu.Text = "<span style=color:red>Passmarks Should not be more than No. of Questions</span>(" + txtNoofQuestions.Text.Trim() + ")";
            }
            else if ((Convert.ToInt32(txtNoofQuestions.Text.Trim()) == 0) && (Convert.ToInt32(txtTime.Text.Trim()) != 0))
            {
                lblshowcurrentqu.Text = "<span style=color:red>There is No Questions to Write.Time will not saved.</span>";
            }
           else if(((Convert.ToDouble(txtPmarks.Text)/Convert.ToDouble(txtNoofQuestions.Text))*100)<40)
              {
                  double jkl =Math.Ceiling( 0.4* Convert.ToDouble(txtNoofQuestions.Text));

               lblshowcurrentqu.Text="<span style=color:red>Pass Marks at least "+jkl+" </span>";

              }
           
            else
            {
                SqlConnection con = new SqlConnection(constring);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Exampattern Set Examname='" + lblLabel.Text + "',Time='" + txtTime.Text.Trim() + "',PassMarks='" + txtPmarks.Text.Trim() + "',NumberofQuestions='" + txtNoofQuestions.Text.Trim() + "'  where Examid=" + qid+" ", con);
                int n = cmd.ExecuteNonQuery();
                con.Close();
                if (n > 0)
                {
                    clearcontrols();
                    Panel1.Visible = false;
                    gvExampatternShow();

                }

                UpdateRow();

                lblshowcurrentqu.Text = "Updated Successfully..";
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    private void UpdateRow()
    {
        this.btnEdit.Visible = false;
        Cancel.Visible = false;
        lblNew.Text = "Add New Exam";
        clearcontrols();
    }
   private void clearcontrols()
    {
        lblLabel.Text = "";
        txtNoofQuestions.Text = "";
        txtPmarks.Text = "";
        txtTime.Text = "";
 
    }
   protected void btnDelete_Click(object sender, EventArgs e)
   {
       lblshowcurrentqu.Text = "";
       this.Panel1.Visible = false;
       lblshowcurrentqu.Text = "<span style='color:red'>Operation Cancelled.</span>";

   }
   protected void gvExamPattern_PageIndexChanging(object sender, GridViewPageEventArgs e)
   {
       try
       {
           gvExamPattern.SelectedIndex = -1;
           Panel1.Visible = false;
           gvExampatternShow();
           gvExamPattern.PageIndex = e.NewPageIndex;
           gvExamPattern.DataBind();
       }
       catch(Exception ex)
       {
           lblshowcurrentqu.Text = ex.Message.ToString();
       }

   }
}