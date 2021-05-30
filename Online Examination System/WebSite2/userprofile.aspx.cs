using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class userprofile : System.Web.UI.Page
{
    string exname;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Username"] != null)
            {

                lblusername.Text = "Welcome :" + Convert.ToString(Session["Username"]);
                bindstudentdetails();
                bindexamnamedetails();

            }
            else
            {
                Server.Transfer("login.aspx");
            }
        }
    }
    private void bindexamnamedetails()
    {
        try
        {
            ddlexamname.Items.Add("--Select--");
            con.Open();
            // string Examname = "SELECT E.Examname FROM Exampattern E WHERE E.Examname in(select q.Examname from questions q where q.Status like 'Active' and E.NumberofQuestions!=0 group by q.Examname having count(q.examname)>=(E.NumberofQuestions))";

            string Examname = "Select Examname from Exampattern";
            SqlCommand cmd = new SqlCommand(Examname, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ddlexamname.DataSource = ds;
            ddlexamname.DataTextField = "Examname";
            ddlexamname.DataBind();
            ddlexamname.Items.Insert(0, new ListItem("--Select--", "0"));
            con.Close();

            if (!ddlexamname.Items.Contains(new ListItem(exname)))
            {
                UpdatePanel3.Visible = false;
                lblquestionsnotprepared.Visible = true;
                lblProfile.Visible = false;

            }
            else
            {
                ddlexamname.SelectedValue = exname;


            }
            //if (ddlexamname.SelectedItem.ToString() == exname)
            //{
            //    lblquestionsnotprepared.Visible = true;
            //    lblquestionsnotprepared.Text = exname;
            //}



        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }


    }
    private void bindstudentdetails()
    {

        try
        {
            int currentdate = DateTime.Now.Year;
            int startdate = currentdate - 10;
            for (int i = 1; i < 11; i++)
            {
                ddlYearofpass.Items.Add((startdate + i).ToString());
            }
            string s = "Select * from Users where Username='" + Session["Username"].ToString() + "'";



            con.Open();
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                exname = dr[17].ToString();
                txtFatherName.Text = dr[19].ToString();
                rdgender.SelectedValue = dr[9].ToString();
                txtPercentage.Text = dr[11].ToString();
                txtExp.Text = dr[21].ToString();
                txtEmailId.Text = dr[3].ToString();
                txtFirstName.Text = dr[4].ToString();
                txtLastName.Text = dr[5].ToString();
                txtMobile.Text = dr[7].ToString();
                txtAddress.Text = dr[10].ToString();
                ddlqualification.SelectedValue = dr[12].ToString();

                if (ddlqualification.SelectedValue != dr[12].ToString())
                {
                    ddlqualification.SelectedValue = "Other";
                    txtOther.Visible = true;
                    txtOther.Text = dr[12].ToString();
                }
                ddlSpecilization.SelectedValue = dr[13].ToString();
                if (ddlSpecilization.SelectedValue != dr[13].ToString())
                {
                    ddlSpecilization.SelectedValue = "Other";
                    txtSpecilization.Visible = true;

                    txtSpecilization.Text = dr[13].ToString();
                }
                ddlYearofpass.SelectedValue = dr[18].ToString();
                if (ddlYearofpass.SelectedValue == "--select--")
                {
                    ddlYearofpass.Items.Add(new ListItem("other", "other"));
                    ddlYearofpass.SelectedValue = "other";
                    txtyear.Visible = true;
                    txtyear.Text = dr[18].ToString();
                }

                dr.Close();
                con.Close();

            }

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }

    }
    protected void ddlqualification_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlqualification.SelectedValue == "Other")
            {
                reqOther.Enabled = true;
                reqOther.Visible = true;
                txtOther.Visible = true;
                reqtxtOther.Visible = true;
            }
            else
            {
                reqOther.Enabled = false;
                reqOther.Visible = false;
                txtOther.Visible = false;
                reqtxtOther.Visible = false;
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void ddlSpecilization_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSpecilization.SelectedValue == "Other")
        {
            reqOtherSpecilization.Enabled = true;
            reqOtherSpecilization.Visible = true;
            txtSpecilization.Visible = true;
            reqtxtspecializtion.Visible = true;
        }
        else
        {
            reqtxtspecializtion.Visible = false;
            reqOtherSpecilization.Visible = false;
            reqOtherSpecilization.Enabled = false;
            txtSpecilization.Visible = false;
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        reqExamname.Visible = true;
        ddlexamname.Enabled = true;
        txtSpecilization.Enabled = true;
        txtOther.Enabled = true;
        txtAddress.Enabled = true;
        txtEmailId.Enabled = true;
        txtFatherName.Enabled = true;
        txtFirstName.Enabled = true;
        txtLastName.Enabled = true;
        txtMobile.Enabled = true;
        ddlqualification.Enabled = true;
        ddlSpecilization.Enabled = true;
        ddlYearofpass.Enabled = true;
        rdgender.Enabled = true;
        txtExp.Enabled = true;
        txtPercentage.Enabled = true;
        this.btnEdit.Visible = false;
        btnContinue.Visible = false;
        this.btnUpdateandContinue.Visible = true;

        if (txtOther.Visible == true)
        {
            txtOther.Enabled = true;
            reqOther.Visible = true;
            reqtxtOther.Visible = true;
        }
        if (txtSpecilization.Visible == true)
        {
            reqOtherSpecilization.Visible = true;

            reqOtherSpecilization.Enabled = true;
            txtSpecilization.Enabled = true;
            reqtxtspecializtion.Visible = true;
        }


    }
    protected void btnUpdateandContinue_Click(object sender, EventArgs e)
    {
        try
        {



            if (ddlexamname.SelectedItem.ToString() == "--Select--")
            {
                lblException.Visible = true;
                lblException.Text = "Please Select Examname";
                return;
            }

            txtAddress.Text = txtAddress.Text.Replace("'", "\"");

            string Qualification = "", spc = "";
            if (ddlSpecilization.SelectedValue.ToString() == "Other")
            {
                spc = Convert.ToString(txtSpecilization.Text.Trim());
            }
            else if (ddlSpecilization.SelectedValue.ToString() != "Other")
            {
                spc = ddlSpecilization.SelectedItem.ToString();
            }
            if (ddlqualification.SelectedValue.ToString() == "Other")
            {
                Qualification = Convert.ToString(txtOther.Text.Trim());
            }
            else if (ddlqualification.SelectedValue.ToString() != "Other")
            {
                Qualification = ddlqualification.SelectedItem.ToString();
            }

            string edit = "select Email from users where username!='" + Session["username"].ToString() + "' and Email='" + txtEmailId.Text + "'";
            con.Open();
            SqlCommand cm = new SqlCommand(edit, con);
            string result = (string)cm.ExecuteScalar();
            con.Close();
            if (!string.IsNullOrEmpty(result))
            {
                lblException.Visible = true;
                lblException.Text = "<span style='color:red'> Email Id is already exist.</span>";
            }
            else
            {
                string updatestring = "update users set Fname='" + txtFirstName.Text.Trim() + "',Lname='" + txtLastName.Text.Trim() + "',Email='" + txtEmailId.Text + "',Mobile='" + txtMobile.Text.Trim() + "',Qualification='" + Qualification.Trim() + "',BRANCH='" + spc + "',yearofpass=" + ddlYearofpass.SelectedItem.ToString() + ",Experience=" + txtExp.Text + ",gender='" + rdgender.SelectedItem.ToString() + "',Address='" + txtAddress.Text.Trim() + "',Percentage=" + txtPercentage.Text.Trim() + ", Examname='" + ddlexamname.SelectedItem.ToString() + "' WHERE username='" + Session["Username"].ToString() + "'";
                con.Open();
                SqlCommand update = new SqlCommand(updatestring, con);
                int i = update.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    //                    {Unable to evaluate expression because the code is optimized or a native frame is on top of the call stack.}
                    //                   Server.Transfer("instructions.aspx", false);
                    Response.Redirect("instructions.aspx", false);
                }
                else
                {
                    lblerror.Visible = true;
                    lblException.Text = "Not Success";
                }


            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        try
        {
            //Server.Transfer("instructions.aspx",false);
            Response.Redirect("instructions.aspx", false);
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
            Session.RemoveAll();
            Server.Transfer("login.aspx");
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}