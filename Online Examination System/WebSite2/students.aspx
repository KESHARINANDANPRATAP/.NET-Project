<%@ Page Title="" Language="C#" MasterPageFile="~/super.master" AutoEventWireup="true" CodeFile="~/students.aspx.cs" Inherits="students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        changebackcolor("students");

    </script>
    
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <p style="text-align:center;font-family:Arial; font-size:15px; height: 27px;">
     <asp:Label ID="lblsend" runat="server" 
           Font-Bold="True" Font-Size="14pt" 
            ForeColor="Green" Height="20px" style="text-align:center;" Text="All Registered students details" 
            Width="321px"></asp:Label></p>
        <div>
            <table style="height: 46px; width: 768px; margin-left:215px;border:1px solid;">
                <tr>
                    <td align="center" colspan="4" style="border-bottom:1px solid">
                           <asp:Label ID="lblselect" runat="server" Text="Select Exam Name:"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:DropDownList ID="ddlExamname" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExamname_SelectedIndexChanged" Width="150px" style="margin-left: 40px">
                           </asp:DropDownList>
                    </td> 
                    </tr>
              
                <tr align="center">
                    
                    <td align="right" ><asp:Label ID="lblSearch" runat="server" Text="Username :"></asp:Label>
                    </td>
                    <td align="left" style="width: 296px">
                        <br />
                        <br />
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexpSSN5" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Enter  only alphabets" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[\S]*[a-zA-Z]$" ValidationGroup="sut" />
                        <br />
                        <asp:RequiredFieldValidator ID="requsername0" runat="server" ControlToValidate="txtUsername" ErrorMessage="Required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="sut"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnSearch0" runat="server" OnClick="btnSearch_Click" Text="Search" ValidationGroup="sut" />
                    </td>
                    <td style="font-family: ARial, Helvetica, sans-serif; font-size: x-large; font-weight: bold; color: #FF0000;">

                        OR</td>
                        <td>
                            User Exam Status:<asp:DropDownList ID="ddlUserstatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserstatus_SelectedIndexChanged" width="150px">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Qualified</asp:ListItem>
                                <asp:ListItem>Notqualified</asp:ListItem>
                            </asp:DropDownList>
                    </td>
                </tr>

            </table>
        </div>
        <p style="margin-top: 0px; margin-bottom: 0px;text-align:center ">
            <asp:Label ID="lblnorows" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <div  >
            <center style=" margin:20px;">
            <asp:GridView ID="studentdetails" runat="server" AllowPaging="True" OnPageIndexChanging="studentdetails_PageIndexChanging"   >
                <PagerSettings Position="TopAndBottom" />
                </asp:GridView>
                </center>
        </div>
    </ContentTemplate>

</asp:UpdatePanel>
   
   
</asp:Content>

