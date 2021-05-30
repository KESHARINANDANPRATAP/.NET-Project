<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="Shortcut Icon" href="images/favicon.ico" />
    <title>Login</title>
    <style type="text/css">
        .fieldset_login {
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            background-color: Aqua;
            padding: 5px;
            text-align: center;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
        }

        .selector {
            width: 200px;
            background-color: #FFEEDD;
            border: 2px solid #ECCE8E;
            padding: 5px;
            text-align: center;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border: 1px solid;
        }

        .style2 {
            width: 79px;
        }

        .style3 {
            width: 117px;
        }

        .s {
            vertical-align: middle;
        }

        .style7 {
            width: 79px;
            height: 38px;
        }

        .style8 {
            width: 179px;
            height: 38px;
        }

        .style9 {
            width: 117px;
            height: 38px;
            font-weight: 700;
        }


        .style10 {
            width: 179px;
        }

        .style11 {
            width: 79px;
            height: 39px;
        }

        .style12 {
            width: 179px;
            height: 39px;
        }

        .style13 {
            height: 39px;
            width: 117px;
        }

        .auto-style1 {
            height: 39px;
            width: 144px;
        }

        .auto-style2 {
            width: 144px;
            height: 38px;
            font-weight: 700;
        }

        .auto-style3 {
            width: 144px;
        }
    </style>
</head>
<body style="background-color: #8CD8F9">
    <form id="form1" runat="server" style="width:100%;">

        <table style="width:100%;">
            <tr>
                <td align="center">
                    <h1 title=" Online Examination System" >Online Examination System </h1>

                </td>
            </tr>
            <tr>
                <td align="center" style="width:100%;">

                    <table class="fieldset_login">
                        <tr>
                            <td colspan="3" style="font-family: Arial; font-weight: bold; font-size: 14px; height: 20px; margin-bottom: 6px;">Sign in Here</td>
                        </tr>
                        <tr>
                            <td align="right" class="style11" style="margin-bottom: 4px">

                                <asp:Label ID="lblUname" runat="server" Text="Username"></asp:Label>

                            </td>
                            <td align="left" class="style12">
                                <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter Username.." onkeypress="" AutoComplete="off"
                                    onfocus="this.placeholder=''" onblur="this.placeholder='Enter UserName..'"
                                    Style="margin-left: 24px" Width="128px" MaxLength="30"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqname" runat="server"
                                    ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style1">
                                <asp:RegularExpressionValidator ID="regexpSSN2" runat="server"
                                    ControlToValidate="txtUserName" Display="Dynamic"
                                    ErrorMessage="Enter only alphabets" ForeColor="Red"
                                    ValidationExpression="^[\S]*[a-zA-Z]$" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style7" style="margin-bottom: 4px">
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td align="left" class="style8">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password.."
                                    onfocus="this.placeholder=''" onblur="this.placeholder='Enter Password..'" onPaste="return false"
                                    TextMode="Password" Style="margin-bottom: 0px; margin-left: 27px;"
                                    Width="123px" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                            </td>
                            <td class="auto-style2">
                                <asp:RegularExpressionValidator ID="reqlenght" runat="server"
                                    ControlToValidate="txtPassword" ErrorMessage="verify your password"
                                    ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2"></td>
                            <td class="style10">
                                <asp:Button ID="btnSubmit" runat="server" Text="Sign In"
                                    OnClick="btnSubmit_Click" Width="67px" />
                            </td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td class="style2"></td>
                            <td class="style10">
                                <asp:HyperLink ID="hprforgot" runat="server" Font-Overline="False"
                                    Font-Underline="False" NavigateUrl="~/forgotpwd.aspx">Forgot password</asp:HyperLink></td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td class="style2"></td>
                            <td class="style10">
                                <asp:HyperLink ID="hyrregistration" runat="server" Font-Overline="False"
                                    Font-Underline="False" NavigateUrl="~/studentregistration.aspx">Signup for new Student</asp:HyperLink></td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblincorrect" runat="server" ForeColor="Red"></asp:Label>

                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
    </form>



</body>
</html>
