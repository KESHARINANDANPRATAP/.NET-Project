using System;
using System.Configuration;
using System.Data.SqlClient;


public partial class login : System.Web.UI.Page
{

    DateTime Today = DateTime.Now;
    int lastlogin;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                Session["Username"] = null;
            }

            if (Request.QueryString["success"] != null)
            {
                lblincorrect.Text = Request.QueryString["success"];
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            lblincorrect.Text = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Users where Username ='" + txtUserName.Text.ToLower().Trim() + "'and (Password COLLATE Latin1_General_CS_AS='" + txtPassword.Text.Trim() + "')", con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                if (dr[6].ToString() == "user")
                {
                    Session["Username"] = txtUserName.Text;
                    Session["Examname"] = dr[17].ToString();
                    Session["Userid"] = dr[0].ToString();
                    string sdk = dr[14].ToString();
                    DateTime d = Convert.ToDateTime(dr[14].ToString());
                    int days = Convert.ToInt32((Today - d).TotalDays);
                    if (dr[15].ToString() != "")
                    {
                        DateTime last = Convert.ToDateTime(dr[15].ToString());

                        lastlogin = Convert.ToInt32((Today - last).TotalDays);
                    }

                    if (dr[8].ToString() == "NotCompleted")
                    {
                        //Server.Transfer("instructions.aspx");
                        //Unable to evaluate expression because the code is optimized or a native frame is on top of the call stack.}
                        Response.Redirect("userprofile.aspx");
                    }
                    else if ((lastlogin > 90 && dr[8].ToString() == "Completed"))
                    {

                        dr.Close();


                        string del = "DELETE FROM UserQuestions WHERE     Userid =" + Convert.ToInt32(Session["Userid"]);
                        SqlCommand cmd1 = new SqlCommand(del, con);
                        cmd1.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("userprofile.aspx");

                    }

                    else
                    {
                        lblincorrect.Visible = true;
                        lblincorrect.Text = "Please write Exam after some time";
                    }
                }
                else if (dr[8].ToString() == "Active" & (dr[6].ToString() == "admin" || dr[6].ToString() == "super"))
                {
                    string s = dr[6].ToString();
                    Session["Role"] = dr[6].ToString();
                    Session["Name"] = txtUserName.Text;
                    Session["Examname"] = dr[17].ToString();
                    Response.Redirect("Home.aspx", false);
                }
                else
                {
                    lblincorrect.Text = "Username/Password incorrect...";
                }
            }
            else
            {
                lblincorrect.Text = "Username/Password incorrect...";

            }

        }
        catch (Exception ex)
        {

            lblincorrect.Text = ex.Message.ToString();
        }




    }
}