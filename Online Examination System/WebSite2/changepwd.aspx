<%@ Page Title="" Language="C#" MasterPageFile="~/super.master" AutoEventWireup="true" CodeFile="~/changepwd.aspx.cs" Inherits="changepwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    changebackcolor("changepwd");
    function valida(key) {
        
        var add = document.getElementById('ContentPlaceHolder1_txtAddress');
        if (add.value.length < 250) {
            return true;
        }
        else {
            alert('Should be less then 250 letters')


            return false;
        }
    }
    </script>
<p style="font-family:arial; margin-bottom: 6px; text-align:center">
        <asp:Label ID="lblProfile" runat="server" Font-Bold="True" ForeColor="Green" 
            Text="Personal Profile Details"  
            Font-Size="14pt"></asp:Label>
     </p>
           
    <asp:UpdatePanel ID="updatepanelProfile" runat="server">
           <ContentTemplate>
    <div>
        <center>

        <table border="0" cellpadding="0" cellspacing="0" style="border:2px solid black; margin-left: 5px;">
        <tr>
            <th colspan="3" style="font-family:Arial,Helvetica,sans-serif;font-weight:bold;color:#489cdf;text-align:left;">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="Green" Text="Edit Profile" style="margin-right:10px; float:left; margin-left: 132px;" Width="110px"></asp:Label>
     <asp:Label ID="blmandatory" style="float:right;  margin-left: 0px;"  runat="server" Text="( Mandatory Fields *)" ForeColor="Red" Width="163px"></asp:Label>
            </th>
        </tr>
        <tr>
            <td class="style5" style="width: 105px; height: 26px;" align="right">
                First Name:<span style="color:Red">*</span></td>
            <td class="style4" style="height: 26px">
                <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="a" 
                    MaxLength="50"></asp:TextBox>
            
              </td>
            <td class="style6" style="height: 26px">
            
              <asp:RequiredFieldValidator ID="reqfname" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="reqfnam" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="Enter only alphabets" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
       
        <tr>
            <td class="style5" style="width: 105px; height: 25px;" align="right">
                Last name:<span style="color:Red">*</span></td>
            <td class="style4" style="height: 25px">
                <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="a" MaxLength="50"></asp:TextBox>
            
              </td>
            <td class="style6" style="height: 25px">
            
                <asp:RequiredFieldValidator ID="reqLname7" runat="server" 
                    ControlToValidate="txtLastName" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server"
      id="regexpSSN0" ControlToValidate="txtLastName"
      ValidationExpression="^[a-zA-Z\s]+$"
      ErrorMessage = "Enter only alphabets"
      Display="Dynamic" ForeColor="Red" ValidationGroup="avalid" SetFocusOnError="True" />
            </td>
        </tr>
       
        
     
   
        <tr>
            <td class="style5" style="width: 105px; height: 23px;" align="right">
                Email:<span style="color:Red">*</span>
            </td>
            <td class="style4" style="height: 23px">
                <asp:TextBox ID="txtEmailId" runat="server" ValidationGroup="a" 
                    MaxLength="50" />
            </td>
            <td class="style6" style="height: 23px">
                <asp:RequiredFieldValidator ID="reqemailid" runat="server" 
                    ControlToValidate="txtEmailId" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reqemail" runat="server" 
                    ControlToValidate="txtEmailId" ErrorMessage="Give correct Email format." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
         
        </tr>
        <tr>
            <td class="style5" style="width: 105px" align="right">
                Gender:<span style="color:Red">*</span></td>
            <td class="style4">
                <asp:RadioButtonList ID="radiogender" runat="server"  ValidationGroup="rad"
                    RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            
                  </td>
            <td class="style6"> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="avalid" 
                    ControlToValidate="radiogender" ErrorMessage="Select Gender" 
                    style="color: #FF0000" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td class="style5" style="width: 105px; height: 27px;" align="right" >
                Mobile:<span style="color:Red">*</span></td>
            <td class="style4" style="height: 27px">
                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10"></asp:TextBox>
            </td>
           <td class="style6" style="height: 27px">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                   ControlToValidate="txtMobile" ErrorMessage="Required" ForeColor="Red" 
                   ValidationGroup="avalid"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="reqmobile" runat="server" 
                   ControlToValidate="txtMobile" ErrorMessage="only 10 digits." ForeColor="Red" 
                   ValidationExpression="\d{10}" ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>

     
        
        <tr>
            <td class="style5" style="width: 105px" align="right">
                Address:<span style="color:Red">*</span></td>
            <td class="style4">
                <asp:TextBox ID="txtAddress" runat="server" Height="60px" TextMode="MultiLine" onkeypress="return valida(event)" onPaste=" return false" Width="210px" style="resize:none" MaxLength="250"></asp:TextBox>
               </td>
            <td class="style6">
            
                <asp:RequiredFieldValidator ID="reqaddress" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid"></asp:RequiredFieldValidator>
            
            </td>
        </tr>
       
        <tr>
            <td class="style5" style="height: 33px; width: 105px">
                </td>
            <td class="style4" style="height: 33px">
             <asp:Button ID="sbtButton" runat="server" 
                    Text="Update" Width="100px" onclick="sbtButton_Click" 
                    ValidationGroup="avalid" />
                <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="100px" 
                    style="margin-left:30px" onclick="btnbtncancel_Click" ValidationGroup="a" />
            <td class="style6" style="height: 33px">
            
                <asp:Label ID="lblgnder" runat="server" ForeColor="Green"></asp:Label>
            </td>
        </tr>

    </table>
        </center>
    </div>
    <div style="height: 243px">
<center>
<table style="width:557px; margin-top:20px; height: 158px; border-style:groove;">
<tr>
<td align="right" colspan="2"  style="font-family:Arial;"  class="head">
    <asp:Label ID="lblsend" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="Green" Text="Change Password" style="margin-right:90px"></asp:Label>
    <asp:Label ID="lblreq" runat="server" Text="(Required *)" ForeColor="Red" 
        Font-Size="10pt"></asp:Label></td>
</tr>
<tr>
<td align="right" style="width: 214px; height: 30px;">
    <asp:Label ID="lblCurrent" runat="server" Text="Enter Current Password<span style='color:red'>*</span>"></asp:Label>
</td>
<td align="left" style="height: 30px; width: 315px;">
    <asp:TextBox ID="txtCurrent" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqCurrent" ControlToValidate="txtCurrent" runat="server" 
        ErrorMessage="Required" ForeColor="Red" ValidationGroup="ch"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td align="right" style="width: 214px">
    <asp:Label ID="lblNew" runat="server" Text="New Password<span style='color:red'>*</span>"></asp:Label>
</td>
<td align="left" style="width: 315px">
    <br />
    <asp:TextBox ID="txtNew" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqNew" runat="server" ControlToValidate="txtNew"
        ErrorMessage="Required" ForeColor="Red" ValidationGroup="ch"></asp:RequiredFieldValidator>
                <br />
    <asp:RegularExpressionValidator ID="reqlenght0" runat="server" ControlToValidate="txtNew" ErrorMessage="Minimum Length Should be 6" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$" ValidationGroup="ch"></asp:RegularExpressionValidator>
    </td>
</tr>
<tr>
<td align="right" style="width: 214px">
    <asp:Label ID="lblConfirm" runat="server" 
        Text="Confirm your password&lt;span style='color:red'&gt;*&lt;/span&gt;"></asp:Label>
</td>
<td align="left" style="width: 315px">
    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqConfirm" runat="server" 
        ErrorMessage="Required" ForeColor="Red" ValidationGroup="ch" 
        ControlToValidate="txtConfirm"></asp:RequiredFieldValidator>
    <br />
    </td>
</tr>
<tr>
<td align="right" style="width: 214px;">
    <asp:Button ID="btnSubmit" runat="server" Text="Change Password" ValidationGroup="ch" style="margin-right:20px"
        onclick="btnSubmit_Click" Width="150px"  Height="25"/>
</td>
<td align="left" style="width: 315px">
    <asp:Button ID="btnclear" runat="server" Text="Clear" onclick="btnclear_Click" Height="25px" Width="101px" />
    <asp:CompareValidator ID="Comparepwd" runat="server" 
        ErrorMessage="Confirm " ControlToCompare="txtNew" 
        ForeColor="Red" ValidationGroup="ch" ControlToValidate="txtConfirm">Passwords do not match. Try agin?</asp:CompareValidator>
    </td>
</tr>
<tr>
<td colspan="2" ><center>    <asp:Label ID="lblError" runat="server"></asp:Label></center>

</td>

</tr>
</table>
</center>
</div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

