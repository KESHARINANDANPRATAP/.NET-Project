<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="instructions.aspx.cs" Inherits="instructions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript" language="javascript">


    function DisableBackButton() {
        window.history.forward()
    }
    DisableBackButton();
    window.onload = DisableBackButton;
    window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
    window.onunload = function () { void (0) }


</script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

<p style="float:left;" >
    <asp:Label ID="lblusername" runat="server" Font-Bold="True"></asp:Label></p>
    <asp:LinkButton ID="btnlinksignout" runat="server" style="float:right; margin-right:20px; text-decoration:none;font-family:Arial;" 
        onclick="btnlinksignout_Click" Width="61px" Height="20px" Font-Size="12pt">Sign out</asp:LinkButton>
            <p style="text-align:center"> 
                <asp:Label ID="lblsend" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="Green" Height="25px" style="font-family:Arial"  Text="Terms and Conditions While Writing Exam" Width="411px"></asp:Label>
            </p>
<div>
    
<table style="margin-top:4px; margin-left:62px; margin-right:30px; font-style:normal; font-family:Times New Roman Times New Roman;font-size:20px">

<tr><td>*<br />
    </td><td>Before appearing for the online examination you should strictly ensure yourself that you fulfill the eligibility criteria
stipulated in all respects</td></tr>
<tr><td style="height: 26px">*<br />
    </td>
<td style="height: 26px">Please note that since this is a Professional examination, you should, therefore, put in your best efforts in the
examination.</td>
</tr>
<tr><td>*</td><td>There is One Question is Available at time Press NextQuestion Button for View Next Question</td></tr>
<tr><td>*</td><td>Time Duration is Displayed As Per the scheduleded </td></tr>
<tr><td>*<td>Do not  Refresh or Press Back Button .</td></tr>
<tr><td style="height: 26px">*</td><td style="height: 26px">If You press Any Think Your Exam will considered Disqualified.</td></tr>
<tr><td colspan="2">
    <asp:CheckBox ID="chkAgry" runat="server" Text="I Agree Turns and Conditions" /></td></tr>
<tr><td></td><td></td></tr>
<tr><td>
    &nbsp;</td><td>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit"       style="margin-left: 75px" onclick="btnSubmit_Click" Width="63px" />
        <asp:Label ID="lbldisplay" runat="server" Font-Size="13pt" ForeColor="Red" 
            Text="In order to write Exam, You must agree to Exam's Terms and Conditions" Visible="False"></asp:Label>
    </td></tr>

</table>
</div>
</ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>

