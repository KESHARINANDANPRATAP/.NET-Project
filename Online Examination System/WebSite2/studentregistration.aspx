<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/studentregistration.aspx.cs" Inherits="studentregistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <link rel="Shortcut Icon" href="images/favicon.ico" type="image/x-icon" />
 
    <title>Student Registration</title>
    

<script type="text/javascript">
    function validate(key)
    {
        var add = document.getElementById('txtAddress');
            if (add.value.length <250)
            {
                return true;
            }
            else
            {
                alert('Should be less then 250 letters')
                return false;
            }        
    }
</script>

    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        input
        {            margin-left: 0px;
            }
        table
        {
         
            margin-left: 0px;
            margin-top: 12px;
        }
        table th
        {
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
        .mandatory
        {
            float:right;
        }
        .radioleft
        {
            float:left;
        }
        
    .style1
    {
            width: 311px;
        }
    .style2
    {
        width: 318px;
    }
    .register_head
    {
        background-color:#9ED7FA;
            height: 68px;
            width: 100%;
        }
    .signin
    {
        margin:15 10 0 10;
        float:right;
       -moz-border-radius: 6px;
       -webkit-border-radius: 6px;
        border-radius: 6px;
        text-align:center;
         text-decoration: none;
       
    }
    .body_css
    {
        background-color:#f1f1f1;
    }
    
    .h1
    {
text-align: center;
font-family: 'Open Sans', arial;
color: #555;
font-size: 38px;
font-weight: 300;
margin-top: 27px;
margin-bottom: 50px;
float:right;
    }
    
    .right
    {
        float:right;
        margin:30px 50px 0 0;
    }
    .left
    {
        float:left;
        width:65%;
    margin-left:190px;
    }
        .span
        {
            height:16px;
            width:16px;
            overflow:visible;
            
            background-color:#1D52E4;
        }
   
        .style3
        {
            height: 36px;
        }
        .style4
        {
            width: 311px;
            height: 36px;
        }
        .style5
        {
            width: 318px;
            height: 36px;
        }
        .style6
        {
            height: 45px;
        }
   
        .auto-style1 {
            width: 363px;
        }
        .auto-style2 {
            width: 363px;
            height: 36px;
        }
   
        .auto-style3 {
            width: 333px;
        }
        .auto-style4 {
            float: left;
            width: 333px;
        }
        .auto-style5 {
            width: 333px;
            height: 36px;
        }
   
    </style>

    <script type="text/javascript" language="javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    
    </script>
    <script language="javascript" type="text/javascript" >
    function validateRadioButtonList() {              
         if (document.getElementById("rdgender").checked==false)
    {
    var answer = confirm ("Please confirm selection...")
    if (answer)
    return true;
    else
    return false;
    }
    return true;
    }
        
    }
}
</script>

</head>

<body class="body_css">

    <form id="form1" runat="server">
  <div class="register_head">
  <div class="left"> 
  <h1 style="width: 434px">New Student Registration </h1>
  </div>
 <div class="right">

 <span class="span"> 
       <a href="login.aspx" class="signin" style="background-color: #1D52E4; height: 25px; color: #FFFFFF; width: 50px;">Sign in</a>
 </span>
      
 </div>
    </div>
   <center>
        <table border="0" cellpadding="0" cellspacing="0" >
       
        <tr><td colspan="3">Note: Before proceeding,please ensure that you fulfill the 
            eligibility.
            <asp:Label ID="Label1" CssClass="mandatory" runat="server" Font-Bold="True" ForeColor="Red" 
                Text="* Mandatory Field"></asp:Label>
            </td></tr>
        <tr>

       
            <td>
                First Name:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" Height="21px"></asp:TextBox>
              </td>
            <td class="auto-style1">
            
                <asp:RequiredFieldValidator ID="reqfname" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="Required" ForeColor="Red" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server"
      id="regexpSSN" ControlToValidate="txtFirstName"
      ValidationExpression="^[a-zA-Z\s]+$"
      ErrorMessage = "Enter only alphabets"
      Display="Dynamic" ForeColor="Red" SetFocusOnError="True" /></td>
        </tr>
        <tr>
            <td>
                Last Name:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtLastName" runat="server" MaxLength="50"></asp:TextBox>
               </td>
            <td class="auto-style1">
            
                <asp:RequiredFieldValidator ID="reqLname" runat="server" 
                    ControlToValidate="txtLastName" ErrorMessage="Required" ForeColor="Red" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexpSSN0" runat="server" 
                    ControlToValidate="txtLastName" Display="Dynamic" 
                    ErrorMessage="Enter only alphabets" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z\s]+$" SetFocusOnError="True" />
            </td>
        </tr>
        <tr>
            <td>
                Father Name:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtFatherName" runat="server" MaxLength="50"></asp:TextBox>
              </td>
            <td class="auto-style1">
            
                <asp:RequiredFieldValidator ID="reqFather" runat="server" 
                    ControlToValidate="txtFatherName" ErrorMessage="Required" ForeColor="Red" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexpSSN1" runat="server" 
                    ControlToValidate="txtFatherName" Display="Dynamic" 
                    ErrorMessage="Enter only alphabets" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z\s]+$" SetFocusOnError="True" />
            </td>
        </tr>

        <tr>
            <td>
                Username: <span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUserName" runat="server" MaxLength="30" />
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="reqUsername" runat="server" 
                    ControlToValidate="txtUserName" ErrorMessage="Required" ForeColor="Red" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexpSSN2" runat="server" 
                    ControlToValidate="txtUserName" Display="Dynamic" 
                    ErrorMessage="Enter only alphabets, without spaces." ForeColor="Red" 
                    ValidationExpression="^[\S]*[a-zA-Z]$" SetFocusOnError="True" />
            </td>
        </tr>
        <tr>
            <td>
                Password:<span style="color:Red">*</span>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" onPaste=" return false"
                    placeholder="case censitive" MaxLength="20"/>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="reqpwd" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Required" ForeColor="Red" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reqlenght" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Minimum Lenth should be 6" 
                    ForeColor="Red" ValidationExpression="^[\s\S]{6,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Confirm Password:<span style="color:Red">*</span>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" onPaste="return false"
                    placeholder="case censitive" MaxLength="20"/>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="reqconfirm" runat="server" 
                    ControlToValidate="txtConfirmPassword" ErrorMessage="Required" 
                    ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="reqcmp" runat="server" ControlToCompare="txtPassword" 
                    ControlToValidate="txtConfirmPassword" ErrorMessage="Mismatch Passwords" 
                    ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                Email:<span style="color:Red">*</span>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtEmailId" runat="server" Height="21px" MaxLength="50" />
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="reqemailid" runat="server" 
                    ControlToValidate="txtEmailId" ErrorMessage="Required" ForeColor="Red" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reqemail" runat="server" 
                    ControlToValidate="txtEmailId" ErrorMessage="Give correct Email format." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
         
        </tr>
        <tr>
            <td>
                Gender:<span 
                    style="color:Red">*</span></td>
            <td align="left" class="auto-style4" >  
<asp:RadioButtonList ID="rdgender" runat="server"  ValidationGroup="rad"
                    RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            
                  </td>
            <td class="auto-style1"> 
<asp:RequiredFieldValidator ID="reqgender" runat="server" 
ErrorMessage="Select Gender" style="color: #FF0000" ControlToValidate="rdgender" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Highest
                Qualification:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlqualification" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlqualification_SelectedIndexChanged" 
                            ValidationGroup="sp" Width="140px">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Phd</asp:ListItem>
                            <asp:ListItem>MTECH</asp:ListItem>
                            <asp:ListItem>BTECH</asp:ListItem>
                            <asp:ListItem>Degree</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtOther" runat="server" Visible="False" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqOther" runat="server" 
                            ControlToValidate="txtOther" ErrorMessage="Required" ForeColor="Red" Visible="False" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:RegularExpressionValidator ID="reqtxtOther" runat="server" ControlToValidate="txtOther" ErrorMessage="Enter only alphabets" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" Visible="False" />
                    </ContentTemplate>
                </asp:UpdatePanel>
             </td>
            <td class="auto-style1">
            
                <asp:RequiredFieldValidator ID="reqQualification" runat="server" 
                    ErrorMessage="Required" ForeColor="Red" InitialValue="--Select--" 
                    ControlToValidate="ddlqualification" SetFocusOnError="True" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td class="style6">Specilization:<span style="color:Red">*</span></td>
            <td colspan="2" class="style6">
           
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>                
                        <asp:DropDownList ID="ddlSpecilization" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlSpecilization_SelectedIndexChanged" 
                            ValidationGroup="sp" Width="140px">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>CSE</asp:ListItem>
                            <asp:ListItem>ECE</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                            <asp:ListItem>EEE</asp:ListItem>
                            <asp:ListItem>MPCS</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
            
     <asp:TextBox ID="txtSpecilization" runat="server" Visible="False" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqOtherSpecilization" runat="server" 
                    ControlToValidate="txtSpecilization" ErrorMessage="Required" 
                    ForeColor="Red" Visible="False" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
                <asp:RequiredFieldValidator ID="reqddlspecilization0" runat="server" 
                    ControlToValidate="ddlSpecilization" ErrorMessage="Required" InitialValue="--Select--" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   
                        <asp:RegularExpressionValidator ID="reqtxtspecializtion" runat="server" ControlToValidate="txtSpecilization" Display="Dynamic" ErrorMessage="Enter only alphabets" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" Visible="False" />
                   
       </ContentTemplate>
                </asp:UpdatePanel>
     
          </td>
        </tr>
        <tr>
            <td class="style3">
                Percentage:<span style="color:Red">*</span></td>
            <td class="auto-style5">
                <asp:TextBox ID="txtPercentage" runat="server" MaxLength="2" 
                    ></asp:TextBox>
            
                <asp:Label ID="lblerror0" runat="server" ForeColor="Black" 
                    Text="(Ex. 75)" ></asp:Label>
             </td>
            <td class="auto-style2">
            
                <asp:RequiredFieldValidator ID="reqPercentage" runat="server" 
                    ControlToValidate="txtPercentage" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
               <asp:RegularExpressionValidator ID="regpercentage" runat="server" 
                   ControlToValidate="txtPercentage" ErrorMessage="Only digits."  
                   ValidationExpression="\d+" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
            
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="txtPercentage" ErrorMessage="At least 50%  Required." 
                    ForeColor="Red" MaximumValue="99" MinimumValue="50" SetFocusOnError="True"></asp:RangeValidator>
            
            </td>
        </tr>



        <tr >
            <td >
                Mobile:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" ></asp:TextBox>
            </td>
           <td class="auto-style1">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                   ControlToValidate="txtMobile" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="regulExpression" runat="server" 
                   ControlToValidate="txtMobile" ErrorMessage="Only 10 digits"  
                   ValidationExpression="\d{10}" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr >
            <td >
                Year of Pass:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:DropDownList ID="ddlYearofpass" runat="server" Width="140px" >
                    <asp:ListItem>--Select--</asp:ListItem>
                   
                </asp:DropDownList>
            </td>
           <td class="auto-style1">
               <asp:RequiredFieldValidator ID="reqyearofpass" runat="server" 
                   ControlToValidate="ddlYearofpass" ErrorMessage="Required" ForeColor="Red" 
                   InitialValue="--Select--" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td>
                Address:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtAddress" runat="server" Height="60px" TextMode="MultiLine" onkeypress="return validate(event)" onPaste=" return false" Width="210px" style="resize:none" MaxLength="250"></asp:TextBox>
               </td>
            <td class="auto-style1">
            
                <asp:RequiredFieldValidator ID="reqaddress" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
            </td>
        </tr>
        <tr>
        <td>Experience(In Months):<span style="color:Red">*</span></td>
        <td class="auto-style3">
            <asp:TextBox ID="txtExp" runat="server" MaxLength="3"></asp:TextBox>
        </td>
        <td class="auto-style1">
            <asp:RequiredFieldValidator ID="reqexp" runat="server" 
                ControlToValidate="txtExp" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="regulExpression0" runat="server" 
                   ControlToValidate="txtExp" ErrorMessage="Only digits"  
                   ValidationExpression="\d+" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        
        <tr>
            <td>
                Exam Name:<span style="color:Red">*</span></td>
            <td class="auto-style3">
                <asp:DropDownList ID="ddlexamname" runat="server" Width="140px" 
                 >
                                </asp:DropDownList>
            </td>
            <td class="auto-style1">
            
                <asp:RequiredFieldValidator ID="reqddlexam" runat="server" 
                    ControlToValidate="ddlexamname" ErrorMessage="Required" 
                    InitialValue="--Select--" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
              </td>
        </tr>

        <tr>
            <td>
                </td>
            <td class="auto-style3">
                <asp:Button ID="sbtButton" runat="server" 
                    Text="Submit" onclick="sbtButton_Click" Width="61px" />
                <asp:Label ID="lblException" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style1">
            
                <asp:Label ID="lblerror" runat="server" ForeColor="Red" 
                    Text="Please complete details" Visible="False"></asp:Label>
            </td>
        </tr>

    </table>
    </center>
    </form>
</body>
</html>
