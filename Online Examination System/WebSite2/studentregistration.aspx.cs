using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class studentregistration : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["con"].ToString();
          
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            txtPassword.Attributes.Add("value", txtPassword.Text.Trim());
            txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text.Trim());
            if (!IsPostBack)
            {
                bindexamnamedetails();
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
            ddlexamname.Items.Add("--Select--");
            SqlConnection connection = new SqlConnection(constring);
            connection.Open();
            string Examname = "SELECT E.Examname,E.Examid FROM Exampattern E WHERE E.Examname in(select q.Examname from questions q where q.Status like 'Active' and E.NumberofQuestions!=0 group by q.Examname having count(q.examname)>=(E.NumberofQuestions))";
            SqlCommand cmd = new SqlCommand(Examname, connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ddlexamname.DataSource = ds;
            ddlexamname.DataTextField = "Examname";
            ddlexamname.DataValueField = "Examid";
            ddlexamname.DataBind();
            ddlexamname.Items.Insert(0, new ListItem("--Select--", "0"));
            connection.Close();
            int currentdate = DateTime.Now.Year;
            int startdate = currentdate - 10;
            for (int i = 1; i < 11; i++)
            {
                ddlYearofpass.Items.Add((startdate + i).ToString());
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }


    }
    protected void sbtButton_Click(object sender, EventArgs e)
    {
        try
        {
            string Qualification= "", spc = "";
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

            if (ddlexamname.SelectedItem.ToString() == "--Select--")
            {
                lblException.Text = "Please select Exam Name";
            }
            else
            {
                txtAddress.Text = txtAddress.Text.Replace("'", "\"");

                float j = (float)Convert.ToDouble(txtPercentage.Text);
                int userId = 0;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("Insert_Onlineusers"))
                    {
                                                txtAddress.Text = txtAddress.Text.Replace("\"", "'");
                          cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", txtUserName.Text.ToLower().Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmailId.Text.Trim());
                        cmd.Parameters.AddWithValue("@Fname", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Fathername", txtFatherName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Lname", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Role", "user");
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        cmd.Parameters.AddWithValue("@Status", "NotCompleted");
                        cmd.Parameters.AddWithValue("Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Gender", rdgender.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@Branch", spc);
                        cmd.Parameters.AddWithValue("@Percentage", j);
                        cmd.Parameters.AddWithValue("@Examname", ddlexamname.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@Qualification", Qualification);
                        cmd.Parameters.AddWithValue("@Yearofpass", ddlYearofpass.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@Experience", Convert.ToInt32(txtExp.Text.Trim()));
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                    string message = string.Empty;
                    switch (userId)
                    {
                        case -1:
                            message = "Username already exists.\\nPlease choose a different username.";
                            break;
                        case -2:
                            message = "EmailId is already been used.";
                            break;
                        default:

                            message = "Registration successful.";

                            break;
                    }
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);

                    if (message == "Registration successful.")
                    {
                        clearcontrols();
                   Response.Redirect("login.aspx?success=" + message,false);                        
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblException.Text=ex.ToString();
        }
    }
    private void clearcontrols()
    {
        try
        {
            foreach (Control i in this.Form.Controls)
            {
                if (i is TextBox)
                {
                    TextBox txt = (TextBox)i;
                    txt.Text = "";
                }
            }
            ddlexamname.SelectedIndex = 0;
            rdgender.SelectedIndex = -1;

        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void ddlqualification_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlqualification.SelectedValue.ToString() == "Other")
            {
                txtOther.Text = "";
                txtOther.Visible = true;
                 reqOther.Visible = true;
                 reqtxtOther.Visible = true;
            }
            else
            {
                     txtOther.Visible = false;
                    reqOther.Visible = false;
                    reqtxtOther.Visible = false;
            }
        }
        catch(Exception ex)
        {
            lblException.Text = ex.ToString();
        }
    }
    protected void ddlSpecilization_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlSpecilization.SelectedValue.ToString() == "Other")
            {
                txtSpecilization.Text = "";
                txtSpecilization.Visible = true;
                reqOtherSpecilization.Visible = true;
                reqtxtspecializtion.Visible = true;
            }
            else
            {
                txtSpecilization.Visible = false;
                reqOtherSpecilization.Visible = false;
                reqtxtspecializtion.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblException.Text = ex.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clearcontrols();                  
    }
}