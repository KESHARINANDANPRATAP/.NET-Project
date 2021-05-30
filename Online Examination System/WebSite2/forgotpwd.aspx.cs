using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class forgotpwd : System.Web.UI.Page
{
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtEmailid.Text == "" && txtUsername.Text == "")
            {
                lblincorrect.Visible = true;
               
                              

                lblincorrect.Text = "Should fill any One.";
            }
            else
            {
                lblpwd.Text = "";
                lblpwddisplay.Text = "";
                string constring = ConfigurationManager.ConnectionStrings["con"].ToString();
                SqlConnection con = new SqlConnection(constring);
                con.Open();
                string forgot = "SELECT Username, Email, Password, Role FROM Users WHERE (Email = '" + txtEmailid.Text.Trim() + "') OR( Username= '" + txtUsername.Text.Trim() + "')";
                SqlCommand cmd = new SqlCommand(forgot, con);
                SqlDataReader dr = cmd.ExecuteReader();
                int i = Convert.ToInt32(dr.Read());
                if (i > 0)
                {

                    string sd = dr["Role"].ToString();

                    if (dr["Role"].ToString() != "admin" && dr["Role"].ToString() !="super")
                    {
                        lblpwd.Visible = true;
                        lblpwd.Text = "Password : ";
                        lblpwddisplay.Visible = true;
                        lblpwd.Visible = true;
                        txtEmailid.Text = "";
                        txtUsername.Text = dr["username"].ToString();
                        lblpwddisplay.Text = dr["Password"].ToString();
                        con.Close();
                        lblincorrect.Visible = false;
                    }

                    else
                    {
                        
                        lblpwddisplay.Text = "";
                        lblpwd.Text = "";
                        string s = "Your Username is: " + dr["Username"].ToString() + "\n Your Password is :" + dr["Password"].ToString();
                       string emailList = "msuresh551@gmail.com";
                        MailMessage mail = new MailMessage("msuresh551@gmail.com", emailList, "Login Details of Synfosys Online Examination System..", s);
                        string b = dr["Email"].ToString();
                        mail.Bcc.Add(b);
                        SmtpClient clint = new SmtpClient("smtp.gmail.com");
                        clint.Port = 587;
                        clint.Credentials = new System.Net.NetworkCredential("msuresh551@gmail.com", "haimahesh123");
                        clint.EnableSsl = true;
                        clint.Send(mail);
                        lblincorrect.Visible = true;
                        lblincorrect.Text = "Password has been sent to Your Email.";
                    }                    
                }
                else
                {
                    lblincorrect.Visible = true;
                    lblincorrect.Text = "Username/Email not exists";
                }

            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        
        txtEmailid.Text = "";
        txtUsername.Text = "";
        lblpwddisplay.Text = "";
        lblpwd.Text = "";
        lblincorrect.Visible = false;
    }
    
}