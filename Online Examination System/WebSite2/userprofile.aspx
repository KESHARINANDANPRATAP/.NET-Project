<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="~/userprofile.aspx.cs" Inherits="userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="font-family: arial; margin-bottom: 6px; text-align: center">
        <asp:Label ID="lblusername" runat="server" Style="float: left" Font-Bold="True"></asp:Label>

        <asp:Label ID="lblProfile" runat="server" Font-Bold="True" ForeColor="Green"
            Text="Your Personal Details"
            Font-Size="14pt"></asp:Label>

        <asp:LinkButton ID="btnlinksignout" runat="server" Style="float: right; margin-right: 20px; text-decoration: none;"
            OnClick="btnlinksignout_Click" Width="61px" Height="20px">Sign out</asp:LinkButton>
    </p>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>


            <div>
                <center>

                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="3">Note: Before proceeding,please ensure that you fulfill the 
            eligibility.
            <asp:Label ID="Label1" CssClass="mandatory" runat="server" Font-Bold="True" ForeColor="Red" Style="float: right"
                Text="* Mandatory Field"></asp:Label>
                            </td>
                        </tr>
                        <tr>


                            <td>First Name:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" Height="21px" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">

                                <asp:RequiredFieldValidator ID="reqfname" runat="server"
                                    ControlToValidate="txtFirstName" ErrorMessage="Required" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server"
                                    ID="regexpSSN" ControlToValidate="txtFirstName"
                                    ValidationExpression="^[a-zA-Z\s]+$"
                                    ErrorMessage="Enter only alphabets"
                                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="UPDATE" /></td>
                        </tr>
                        <tr>
                            <td>Last Name:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">

                                <asp:RequiredFieldValidator ID="reqLname" runat="server"
                                    ControlToValidate="txtLastName" ErrorMessage="Required" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpSSN0" runat="server"
                                    ControlToValidate="txtLastName" Display="Dynamic"
                                    ErrorMessage="Enter only alphabets" ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z\s]+$" SetFocusOnError="True" ValidationGroup="UPDATE" />
                            </td>
                        </tr>
                        <tr>
                            <td>Father Name:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:TextBox ID="txtFatherName" runat="server" MaxLength="50" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">

                                <asp:RequiredFieldValidator ID="reqFather" runat="server"
                                    ControlToValidate="txtFatherName" ErrorMessage="Required" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpSSN1" runat="server"
                                    ControlToValidate="txtFatherName" Display="Dynamic"
                                    ErrorMessage="Enter only alphabets" ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z\s]+$" SetFocusOnError="True" ValidationGroup="UPDATE" />
                            </td>
                        </tr>


                        <tr>
                            <td>Email:<span style="color: Red">*</span>
                            </td>
                            <td class="style1" style="width: 472px">
                                <asp:TextBox ID="txtEmailId" runat="server" Height="21px" MaxLength="50" Enabled="False" />
                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="reqemailid" runat="server"
                                    ControlToValidate="txtEmailId" ErrorMessage="Required" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reqemail" runat="server"
                                    ControlToValidate="txtEmailId" ErrorMessage="Give correct Email format."
                                    ForeColor="Red"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="UPDATE"></asp:RegularExpressionValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>Gender:<span
                                style="color: Red">*</span></td>
                            <td align="left" style="float: left; width: 472px;">
                                <asp:RadioButtonList ID="rdgender" runat="server" ValidationGroup="rad"
                                    RepeatDirection="Horizontal" Enabled="False">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>

                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="reqgender" runat="server"
                                    ErrorMessage="Select Gender" Style="color: #FF0000" ControlToValidate="rdgender"
                                    SetFocusOnError="True" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Highest
                Qualification:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlqualification" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlqualification_SelectedIndexChanged"
                                            ValidationGroup="UPDATE" Width="140px" Enabled="False">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>Phd</asp:ListItem>
                                            <asp:ListItem>MTECH</asp:ListItem>
                                            <asp:ListItem>BTECH</asp:ListItem>
                                            <asp:ListItem>Degree</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtOther" runat="server" Visible="False" MaxLength="50" Enabled="False"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqOther" runat="server"
                                            ControlToValidate="txtOther" ErrorMessage="Required" ForeColor="Red" ValidationGroup="UPDATE" SetFocusOnError="True" Visible="False"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="reqtxtOther" runat="server" ControlToValidate="txtOther" ErrorMessage="Enter only alphabets" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="UPDATE" Visible="False" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td class="auto-style1">

                                <asp:RequiredFieldValidator ID="reqQualification" runat="server"
                                    ErrorMessage="Required" ForeColor="Red" InitialValue="--Select--"
                                    ControlToValidate="ddlqualification" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">Specilization:<span style="color: Red">*</span></td>
                            <td colspan="2" class="style6">

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlSpecilization" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlSpecilization_SelectedIndexChanged"
                                            ValidationGroup="UPDATE" Width="140px" Enabled="False">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>CSE</asp:ListItem>
                                            <asp:ListItem>ECE</asp:ListItem>
                                            <asp:ListItem>IT</asp:ListItem>
                                            <asp:ListItem>EEE</asp:ListItem>
                                            <asp:ListItem>MPCS</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:TextBox ID="txtSpecilization" runat="server" Visible="False" MaxLength="30" Enabled="False"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqOtherSpecilization" runat="server"
                                            ControlToValidate="txtSpecilization" ErrorMessage="Required"
                                            ForeColor="Red" ValidationGroup="UPDATE" Enabled="False" Visible="False" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        <asp:RequiredFieldValidator ID="reqddlspecilization0" runat="server"
                                            ControlToValidate="ddlSpecilization" ErrorMessage="Required" InitialValue="--Select--" ForeColor="Red" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="reqtxtspecializtion" runat="server" ControlToValidate="txtSpecilization" Display="Dynamic" ErrorMessage="Enter only alphabets" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="UPDATE" Visible="False" />

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </td>
                        </tr>
                        <tr>
                            <td class="style3" style="height: 26px">Percentage:<span style="color: Red">*</span></td>
                            <td class="style4" style="height: 26px; width: 472px;">
                                <asp:TextBox ID="txtPercentage" runat="server" MaxLength="2" Enabled="False"></asp:TextBox>

                                <asp:Label ID="lblerror0" runat="server" ForeColor="Black"
                                    Text="(Ex. 75)"></asp:Label>
                            </td>
                            <td class="auto-style2" style="height: 26px">

                                <asp:RequiredFieldValidator ID="reqPercentage" runat="server"
                                    ControlToValidate="txtPercentage" ErrorMessage="Required" ForeColor="Red" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="regpercentage" runat="server"
                                    ControlToValidate="txtPercentage" ErrorMessage="Only digits."
                                    ValidationExpression="\d+" ForeColor="Red" ValidationGroup="UPDATE"></asp:RegularExpressionValidator>

                                <asp:RangeValidator ID="RangeValidator1" runat="server"
                                    ControlToValidate="txtPercentage" ErrorMessage="At least 50%  Required."
                                    ForeColor="Red" MaximumValue="99" MinimumValue="50" SetFocusOnError="True" ValidationGroup="UPDATE"></asp:RangeValidator>

                            </td>
                        </tr>



                        <tr>
                            <td>Mobile:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="txtMobile" ErrorMessage="Required" ForeColor="Red" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regulExpression" runat="server"
                                    ControlToValidate="txtMobile" ErrorMessage="Only 10 digits"
                                    ValidationExpression="\d{10}" ForeColor="Red" ValidationGroup="UPDATE"></asp:RegularExpressionValidator>
                            </td>
                        </tr>

                        <tr>
                            <td>Year of Pass:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:DropDownList ID="ddlYearofpass" runat="server" Width="140px" Enabled="False">
                                    <asp:ListItem>--Select--</asp:ListItem>

                                </asp:DropDownList>
                                <asp:TextBox ID="txtyear" runat="server" MaxLength="2" Visible="False" Width="57px" Enabled="False"></asp:TextBox>

                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="reqyearofpass" runat="server"
                                    ControlToValidate="ddlYearofpass" ErrorMessage="Required" ForeColor="Red"
                                    InitialValue="--Select--" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td>Address:<span style="color: Red">*</span></td>
                            <td class="style1" style="width: 472px">
                                <asp:TextBox ID="txtAddress" runat="server" Height="60px" TextMode="MultiLine" onkeypress="return valida(event)" onPaste=" return false" Width="210px" Style="resize: none" MaxLength="250" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">

                                <asp:RequiredFieldValidator ID="reqaddress" runat="server"
                                    ControlToValidate="txtAddress" ErrorMessage="Required" ForeColor="Red" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>Experience(In Months):<span style="color: Red">*</span></td>
                            <td style="width: 472px">
                                <asp:TextBox ID="txtExp" runat="server" MaxLength="3" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="reqexp" runat="server"
                                    ControlToValidate="txtExp" ErrorMessage="Required" ForeColor="Red" ValidationGroup="UPDATE"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regulExpression0" runat="server"
                                    ControlToValidate="txtExp" ErrorMessage="Only digits"
                                    ValidationExpression="\d+" ForeColor="Red" ValidationGroup="UPDATE"></asp:RegularExpressionValidator>
                            </td>
                        </tr>

                        <tr>

                            <td>Examname</td>
                            <td>
                                <asp:DropDownList ID="ddlexamname" runat="server" Width="140px" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqExamname" runat="server" ControlToValidate="ddlexamname" ErrorMessage="Required" ForeColor="Red" InitialValue="--Select--" ValidationGroup="UPDATE" Visible="False"></asp:RequiredFieldValidator>
                            </td>

                        </tr>

                        <tr>
                            <td></td>
                            <td class="style1" style="width: 472px">
                                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" Width="57px" Style="height: 26px" />
                                <asp:Button ID="btnUpdateandContinue" runat="server"
                                    Text="Update and Continue" OnClick="btnUpdateandContinue_Click" Width="142px" Visible="False" ValidationGroup="UPDATE" />
                                <asp:Button ID="btnContinue" runat="server" Text="Save and Continue" OnClick="btnContinue_Click" />
                            </td>
                            <td class="auto-style1">

                                <asp:Label ID="lblException" runat="server" ForeColor="Red"></asp:Label>

                                <asp:Label ID="lblerror" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                            </td>
                        </tr>

                    </table>
                </center>
            </div>

        </ContentTemplate>

    </asp:UpdatePanel>

    <center>
        <asp:Label ID="lblquestionsnotprepared" runat="server" ForeColor="Green"
            Text="Questions not prepared yet." Visible="False"></asp:Label>

    </center>
    <script type="text/javascript">
        function valida(key) {
            debugger;
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

</asp:Content>

