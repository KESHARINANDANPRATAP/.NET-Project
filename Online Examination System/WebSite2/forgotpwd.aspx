<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/forgotpwd.aspx.cs" Inherits="forgotpwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
 
    <title>Forgot password</title>
    <script type="text/javascript">
        function emtyval() {
           
    if((document.getElementById('txtEmailid').value=="") && (document.getElementById('txtUsername').value==""))
    {
        alert('Please fill any one.');
        return false;
    }
    return true;
        }

        function name() {
            document.getElementById('txtUsername').value = "";
        }
        function Email()
        {
            document.getElementById('txtEmailid').value = "";
        }

    </script>
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
        .style3
        {
            height: 37px;
        }
        .style4
        {
            height: 46px;
        }
        .auto-style1 {
            height: 47px;
        }
        .auto-style2 {
            height: 28px;
        }
    </style>
</head>
<body  style="background-color:#D3F8F4">
  
    
    <form id="form1" runat="server">
          <asp:UpdatePanel ID="panelforgot" runat="server">
        <ContentTemplate>
    <div style="text-align:center; margin-top: 181px;" ><center>
        <br />
        <br />
        <br />
        <br />
    <table bgcolor="#33CCFF" cellpadding="2px" cellspacing="0px"      style=" -webkit-border-radius: 20px;-moz-border-radius:20px; width: 511px; border:1px solid">
   <tr><td colspan="2" class="style4"><center style="font-weight: bold"> Forgot Password </center></td></tr>
    <tr>
    <td class="style1" align="right">Enter E-mail: </td><td class="style1">
        <asp:TextBox ID="txtEmailid" runat="server" Width="157px" onkeypress="name();" AutoComplete="off"
            style="margin-left: 0px" ValidationGroup="1" MaxLength="50" ></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:Label 
            ID="Label2" runat="server" Text="(Or)"  style="float:inherit;"></asp:Label>
        <asp:RegularExpressionValidator 
            ID="reqEmail" runat="server" ControlToValidate="txtEmailid" 
            ErrorMessage="Give correct Email format." ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="1" SetFocusOnError="True"></asp:RegularExpressionValidator>
        </td></tr>
        
        <tr><td class="style3" align="right" style="margin-bottom:0px;">Username:</td><td class="style3">
            <asp:TextBox ID="txtUsername" runat="server" Width="161px" ValidationGroup="1" onkeypress="Email();"
                MaxLength="30" AutoComplete="off"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regexpSSN1" runat="server" 
                    ControlToValidate="txtUsername" Display="Dynamic" 
                    ErrorMessage="Enter only alphabets" ForeColor="Red" 
                    ValidationExpression="^[\S]*[a-zA-Z]$" SetFocusOnError="True" ValidationGroup="1" />
            </td></tr>

                
                    <tr><td class="auto-style2" align="right">
                        <asp:Label ID="lblpwd" runat="server" Text="Password :" Visible="False"></asp:Label>
                        </td><td class="auto-style2">
                        <asp:Label ID="lblpwddisplay" runat="server" Text="Label" Visible="False"></asp:Label></td>
                        </tr>
                        <tr>
                        <td align="right" class="auto-style1" ><asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="103px" 
                                onclick="btnsubmit_Click" OnClientClick="return emtyval()" 
                                style="margin-left: 0px; height: 26px;" ValidationGroup="1" />
                          </td>
                                <td align="left" class="auto-style1" style="margin-top:0px;">
                                    <asp:Button ID="btnClear" runat="server" onclick="btnClear_Click" Text="Clear" 
                                        Width="103px" Height="26px" />
                                    <div style="float:right; width: 118px; margin-right:150px;""><asp:UpdateProgress ID="mailstoadmins" AssociatedUpdatePanelID="panelforgot" runat="server">
                                    <ProgressTemplate>
                                       <img alt="progress" width="150px" height="70px" src="images/progressbarset.gif" style="height: 22px; width: 122px"/>
                                    </ProgressTemplate>  
                                    </asp:UpdateProgress>
                                        </div>
                            </td>
                                </tr>
                                <tr><td colspan="2">
                           <center><p><asp:Label ID="lblincorrect" runat="server" 
                                Text="In-Correct Details. Try again." ForeColor="Red" Visible="False"></asp:Label>
                              <a href="login.aspx"><asp:Label ID="Label1" runat="server" Text="Log in Here"></asp:Label></a>
                               </p> 
                            </center></td></tr>
                    </table>
    
        </center>
    
    </div>


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
             </ContentTemplate></asp:UpdatePanel>
    </form>

       



</body>
</html>
