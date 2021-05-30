<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminregister.aspx.cs" Inherits="adminregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script type="text/javascript">
        changebackcolor("addadmin");
  
</script>

    <style type="text/css">
        .multi
        {
           resize: none;
        }
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
      
       
        table th
        {
           
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
    .style1
    {
        width: 176px;
        
    }
    .style2
    {
        width: 318px;
    }
        .style4
        {
            width: 289px;
        }
        .style5
        {
            width: 129px;
        }
        .style6
        {
            width: 323px;
        }
        .auto-style1 {
            width: 129px;
            height: 32px;
        }
        .auto-style2 {
            width: 289px;
            height: 32px;
        }
        .auto-style3 {
            width: 323px;
            height: 32px;
        }
    </style>
   <script type="text/javascript">
       function valida(key) {
           var add = document.getElementById('ContentPlaceHolder1_txtAddress')
           if (add.value.length < 250) {
               return true;
           }
           else {
               alert('Should be less then 250 letters')
               return false;
           }
       }
</script>
    <div>
    <p align="center">
        <asp:Label ID="lblsend" runat="server" Font-Bold="True" ForeColor="Green" 
            Text="Admin Registration"  
            Font-Size="14pt"></asp:Label>
        </p>

        <asp:UpdatePanel ID="updatereg" runat="server">
        <ContentTemplate>
        <center>
        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <th colspan="3" style="font-family:Arial,Helvetica,sans-serif;font-weight:bold;color:#489cdf;text-align:left;">
     <asp:Label ID="blmandatory" style="float:right;  margin-left: 0px;" 
            runat="server" Text="( Mandatory Fields *)" ForeColor="Red" Width="139px"></asp:Label>
            </th>
        </tr>
        <tr>
            <td class="style5">
                First Name:<span style="color:Red">*</span></td>
            <td class="style4">
                <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="a" 
                    MaxLength="50"></asp:TextBox>
            
              </td>
            <td class="style6">
            
              <asp:RequiredFieldValidator ID="reqfname" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="reqfnam" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="Enter only alphabets" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
       
        <tr>
            <td class="style5">
                Last name:<span style="color:Red">*</span></td>
            <td class="style4">
                <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="a" MaxLength="50"></asp:TextBox>
            
              </td>
            <td class="style6">
            
                <asp:RequiredFieldValidator ID="reqLname7" runat="server" 
                    ControlToValidate="txtLastName" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server"
      id="regexpSSN0" ControlToValidate="txtLastName"
      ValidationExpression="^[a-zA-Z\s]+$"
      ErrorMessage = "Enter only alphabets"
      Display="Dynamic" ForeColor="Red" ValidationGroup="avalid" SetFocusOnError="True" />
            </td>
        </tr>
       
        <tr>
            <td class="style5">
                Username:<span style="color:Red">*</span> 
            </td>
            <td class="style4">
                <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="a" 
                    MaxLength="30" />
            </td>
            <td class="style6">
                <asp:RequiredFieldValidator ID="reqUsername" runat="server" 
                    ControlToValidate="txtUserName" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server"
      id="regexpSSN" ControlToValidate="txtUserName"
      ValidationExpression="^[\S]*[a-zA-Z]$"
      ErrorMessage = "Enter only alphabets"
      Display="Dynamic" ForeColor="Red" ValidationGroup="avalid" SetFocusOnError="True" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                Password:<span style="color:Red">*</span>
             </td>
            <td class="style4">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="case censitive"
                    ValidationGroup="a" MaxLength="20" />
            </td>
            <td class="style6">
                <asp:RequiredFieldValidator ID="reqpwd" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reqlenght" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Minimum Length Should be 6" 
                    ForeColor="Red" ValidationExpression="^[\s\S]{6,}$" ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                Confirm Password:<span style="color:Red">*</span>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="case censitive"
                    ValidationGroup="a" MaxLength="20" />
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="reqpwd0" runat="server" 
                    ControlToValidate="txtConfirmPassword" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="reqcmp" runat="server" ControlToCompare="txtPassword" 
                    ControlToValidate="txtConfirmPassword" ErrorMessage="Mismatch Password" 
                    ForeColor="Red" ValidationGroup="avalid" SetFocusOnError="True"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Email:<span style="color:Red">*</span>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtEmailId" runat="server" ValidationGroup="a" 
                    MaxLength="50" />
            </td>
            <td class="style6">
                <asp:RequiredFieldValidator ID="reqemailid" runat="server" 
                    ControlToValidate="txtEmailId" ErrorMessage="Required" ForeColor="Red" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reqemail" runat="server" 
                    ControlToValidate="txtEmailId" ErrorMessage="Give correct Email format." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
         
        </tr>
        <tr>
            <td class="style5">
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
            <td class="style5" >
                Mobile:<span style="color:Red">*</span></td>
            <td class="style4">
                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10"></asp:TextBox>
            </td>
           <td class="style6">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                   ControlToValidate="txtMobile" ErrorMessage="Required" ForeColor="Red" 
                   ValidationGroup="avalid"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="reqmobile" runat="server" 
                   ControlToValidate="txtMobile" ErrorMessage="only 10 digits." ForeColor="Red" 
                   ValidationExpression="\d{10}" ValidationGroup="avalid" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>

        
        <tr >
            <td class="style5" >
                Designation:<span style="color:Red">*</span></td>
            <td class="style4">
                <asp:DropDownList ID="ddlRole" runat="server" Width="150px">
                </asp:DropDownList>
            </td>
           <td class="style6">
               <asp:RequiredFieldValidator ID="reqRole" runat="server" 
                   ControlToValidate="ddlRole" ErrorMessage="Required" 
                   InitialValue="--Select--" ForeColor="Red" ValidationGroup="avalid" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>

        
        <tr>
            <td class="style5">
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
            <td class="style5">
                </td>
            <td class="style4">
             <asp:Button ID="sbtButton" runat="server" 
                    Text="Submit" Width="61px" onclick="sbtButton_Click"
                    ValidationGroup="avalid" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" Width="55px" 
                    style="margin-left:30px" onclick="btnClear_Click" ValidationGroup="a" />
            <td class="style6">
            
                <asp:Label ID="lblgnder" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>

    </table>
    </center>
    </ContentTemplate>
        </asp:UpdatePanel>
</div>
</asp:Content>

