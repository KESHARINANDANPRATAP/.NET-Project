<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="~/Admindetails.aspx.cs" Inherits="Admindetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        changebackcolor("admindetails");
        function validate(key) {
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
    <style type="text/css">
 .selectedrow
 {
   background-color:#DEFE9F;
 }
 .margins
 {
     margin-bottom:30px;
     margin-left:30px;
     margin-right:30px;
 }
 
        .auto-style1 {
            height: 49px;
        }
 
        .auto-style2 {
            height: 30px;
        }
 
 </style>
    
    <asp:UpdatePanel ID="Paneladmindetails" runat="server">
        <ContentTemplate>
 <p style="text-align:center;font-family:Arial; font-size:15px; height: 27px; margin-bottom: 8px;">
     <asp:Label ID="lblsend" runat="server" 
           Font-Bold="True" Font-Size="14pt" 
            ForeColor="Green" Height="20px" style="text-align:center;" 
            Width="251px"></asp:Label></p>

    <asp:Panel ID="panelEdit" runat="server" Visible="False" style="margin-top: 3px" >
 <h4 style="height: 21px; margin-bottom: 5px; margin-top: 7px;">
     <asp:Label ID="blmandatory" style="float:right; margin-right:50px" 
            runat="server" Text="( Mandatory Fields *)" ForeColor="Red"></asp:Label>
        </h4>
      <center>
            <table style="width: 66%; margin-left: 156px;">
            <tr>
                <td align="left">
                    Frist Name:<span style="color:Red">*</span></td>
                <td align="left">
                    <asp:TextBox ID="txtFname" runat="server" ValidationGroup="a" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFname0" runat="server" 
                        ControlToValidate="txtFname" ErrorMessage="Required" ForeColor="Red" 
                        ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reqChar" runat="server" 
                        ControlToValidate="txtFname" ErrorMessage="Enter only alphabets" ForeColor="Red" 
                        ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="a" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="left"> Last Name:<span style="color:Red">*</span></td>
                <td align="left"> <asp:TextBox ID="txtLname" runat="server" style="margin-left: 0px" 
                        MaxLength="50"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="reqlname" runat="server" 
                        ControlToValidate="txtLname" ErrorMessage="Required" ForeColor="Red" 
                        ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reqLast" runat="server" 
                        ControlToValidate="txtLname" ErrorMessage="Enter only alphabets" ForeColor="Red" 
                        ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="a" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    
                    </td>
            </tr>
            <tr>
                <td align="left" class="auto-style2">
                    Email Id:<span style="color:Red">*</span></td>
                <td align="left" class="auto-style2">
                    <asp:TextBox ID="txtEmailid" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtEmailid" ErrorMessage="Required" ForeColor="Red" ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regularex" runat="server" ControlToValidate="txtEmailid" ErrorMessage="Give correct Email format." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="left">
                    User Name:</td>
                <td align="left">
                    <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    Mobile:<span style="color:Red">*</span></td>
                <td align="left">
                    <asp:TextBox ID="txtMobile" runat="server" ValidationGroup="a" MaxLength="10"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="req" runat="server" 
                        ControlToValidate="txtMobile" ErrorMessage="Required" ForeColor="Red" 
                        ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reqmoble" runat="server" 
                        ControlToValidate="txtMobile" ErrorMessage="Enter only 10  digits. " ForeColor="Red" 
                        ValidationExpression="\d{10}" ValidationGroup="a" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="left">
                    Designation:<span style="color:Red">*</span></td>
                <td align="left">
                    <asp:DropDownList ID="ddlDesignation" runat="server"
             DataTextField="Examname" DataValueField="Examid" ValidationGroup="a" Width="140px" >
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqdll" runat="server" 
                        ControlToValidate="ddlDesignation" ErrorMessage="Select Designation" ForeColor="Red" 
                        InitialValue="--Select--" ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr><td  align="left" class="auto-style1">Gender:<span style="color:Red">*</span></td><td align="left" class="auto-style1" >
                    <asp:RadioButtonList ID="radiogender" runat="server" RepeatDirection="Horizontal" ValidationGroup="rad">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="radiogender" ErrorMessage="Select Gender" ForeColor="Red" style="color: #FF0000" ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td></tr>

                <tr>
                    <td align="left">Address:<span style="color:Red">*</span></td>
                    <td align="left">
                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="250" Height="60px" TextMode="MultiLine" style="resize:none;" Width="210px" onkeypress="return validate(event)" onPaste=" return false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqaddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                    <asp:Button ID="btnUpdate" runat="server" 
             Text="Update" onclick="btnUpdate_Click" ValidationGroup="a" style="height: 26px" />
                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                        style="margin-left: 35px" Text="Cancel" Height="26px" />
                </td>
            </tr>
        </table>


          </center>
    </asp:Panel>

    <p style="text-align:center">
        <asp:Label ID="lblupdate" runat="server" Text=""></asp:Label></p>

<div class="margins">
<center>

    <asp:GridView ID="gvAdminusers" runat="server" AutoGenerateDeleteButton="True" 
        onrowdeleting="gvAdminusers_RowDeleting" 
        onselectedindexchanged="gvAdminusers_SelectedIndexChanged" 
        AutoGenerateColumns="False" 
        AutoGenerateSelectButton="True" 
        style="margin-left: 0px" Width="800px" AllowPaging="True" OnPageIndexChanging="gvAdminusers_PageIndexChanging" PageSize="5" OnRowCommand="gvAdminusers_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:Label ID="Fname" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fname") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                    <asp:Label ID="Lname" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Lname") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="mailid" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username">
                <ItemTemplate>
                    <asp:Label ID="Username" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile">
                <ItemTemplate>
                    <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Designation">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Examname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Examname" runat="server" Text='<%# Bind("Examname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ExamID" Visible="false">                
                <ItemTemplate>
                    <asp:HiddenField ID="hdExamID" Value='<%# Bind("Examid") %>' runat="server" Visible="true" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Gender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Address" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnactive" runat="server"   Text="Active" CommandName="Activeadmin"  OnRowCommand="gvInaciveQuestions_RowCommand"  OnClientClick="return confirm('Are you sure want to Active this Admin Details ?');" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>     
        </Columns>
    </asp:GridView>
      </center>
</div>


            </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>

