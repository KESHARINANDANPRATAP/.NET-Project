<%@ Page Title="" Language="C#" MasterPageFile="~/super.master" AutoEventWireup="true" CodeFile="studentresults.aspx.cs" Inherits="studentresults" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        changebackcolor("studentmarks");

</script>
    

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
       
  <p style="text-align:center; height: 32px;font-family:Arial; margin-bottom: 1px;"><asp:Label ID="lblsend" runat="server" 
          Font-Bold="True" ForeColor="Green" 
            Text="Details of Student Attempted Questions and Answers" 
          Font-Size="14pt" ></asp:Label></p>
    <center>
        <p>  
   <table>

        <tr runat="server" id="Examname"><td style="height: 26px; width: 158px;">&nbsp;Exam Name:</td><td style="height: 26px; width: 351px;"> <asp:DropDownList ID="ddlSelectExamname" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlSelectExamname_SelectedIndexChanged" Width="150px">
              </asp:DropDownList></td></tr>
       <tr><td style="width: 158px">&nbsp;Username : </td><td style="width: 351px"> <asp:DropDownList
        ID="ddlUsers" runat="server" style="margin-left: 0px" AutoPostBack="True" 
        onselectedindexchanged="ddlUsers_SelectedIndexChanged" Width="150px">
    </asp:DropDownList></td></tr>
       <tr><td align="center" colspan="2" style="font-weight: 700; color: red;">OR</td></tr>
       <tr><td style="width: 158px">
           <asp:Label ID="lblSearch" runat="server" Text=" Username :"></asp:Label>
           </td><td style="width: 351px">
               <asp:TextBox ID="txtenteruser" runat="server" Height="17px" MaxLength="30" style="margin-left: 0px" Width="150px"></asp:TextBox>
               &nbsp;
               <asp:RequiredFieldValidator ID="reqtxt0" runat="server" ControlToValidate="txtenteruser" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="User"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="reqUser0" runat="server" ControlToValidate="txtenteruser" ErrorMessage="Enter only alphabets" ForeColor="Red" ValidationExpression="[a-zA-Z]*" ValidationGroup="User"></asp:RegularExpressionValidator>
           </td></tr>
       <tr ><td  colspan="2">
           <asp:Button ID="bntSearch" runat="server" Height="25px" onclick="btnSearch_Click" style="margin-left:160px" Text="Search By Username" ValidationGroup="User" Width="152px"  />
         <div style="float:right">  <asp:Label ID="lblnotfond" runat="server" ForeColor="Red"></asp:Label></div>
           </td></tr>
       
      
   </table>


</p>
        </center>
        <p style="text-align:center; margin-bottom: 9px;" id ="stdetails" runat="server"><strong style="color: #0000FF">Student Details</strong></p>
        <div><center>
            &nbsp;<asp:GridView ID="gvStudentDetails" runat="server">
            </asp:GridView>
            </center>
        </div>
        <p style="text-align:center; margin-bottom: 9px;" id ="stExampaper" runat="server"><strong style="color: #0000FF">Student Exam Paper Details</strong></p>
       <center>
            <table cellspacing="0px" cellpadding="10px" >
                <tr>
                    <td colspan="3" align="right">
                        <asp:Label ID="lbltotquestions" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblnoofquestions" runat="server" Font-Bold="True"></asp:Label>
                    </td>             
                    
                    <td style="width: 215px">
                        <asp:Label ID="lbltext" runat="server"></asp:Label></td>
                    <td style="width: 39px">
                        <asp:Image ID="imgRight" runat="server" Height="21px" Width="31px"
                            ImageUrl="~/images/right.jpg" Style="margin-left: 0px" Visible="False" />
                    </td>
                    <td style="width: 45px">
                        <asp:Label ID="lblCorrect" runat="server"></asp:Label></td>

                    <td align="right">
                        <asp:Image ID="imgWrong" runat="server" Height="21px" Width="25px"
                            ImageUrl="~/images/wrong.jpg" Style="margin-left: 0px" Visible="False"></asp:Image></td>
                    <td>
                        <asp:Label ID="lblWrong" runat="server"></asp:Label></td>
                    
                </tr>
            </table>
           </center>
        
<div>
   
    <center style="margin:20px;">
    <asp:GridView ID="gvStudentresults" runat="server" AutoGenerateColumns="true" AllowPaging="True" OnPageIndexChanging="gvStudentresults_PageIndexChanging">
        <%--<Columns>
            <asp:TemplateField HeaderText="Question Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Selected Answer">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Useranswer") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Useranswer") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Actual Answer">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Answer") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Answer") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Conclusion">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("result") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("result") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Option1">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Option1") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Option1") %>'></asp:TextBox>
                </EditItemTemplate>

            </asp:TemplateField>
              <asp:TemplateField HeaderText="Option2">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Option2") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Option2") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Option3">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Option3") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Option3") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Option4">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Option4") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Option4") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>



        </Columns>--%>
    </asp:GridView>
        </cente>
    
</div>


    
    </ContentTemplate>
    </asp:UpdatePanel>
    

</asp:content>

