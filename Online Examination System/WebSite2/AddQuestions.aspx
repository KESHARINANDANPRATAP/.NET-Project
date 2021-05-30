<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="~/AddQuestions.aspx.cs" Inherits="AddQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">

        changebackcolor("questions");
   function length()
     {
         var len = document.getElementById('ContentPlaceHolder1_txtQuestion')
         if (len.value.trim().length > 5000) {
             alert("Question length should be less then 5000 letters.");
             len.focus();
             return false;
         }
     }

</script>
    <style type="text/css">
 .selectedrow
 {
   background-color:#DEFE9F;
 }
 
        .hideColumn
    {
            display:none;
        }
    .style6
    {
        width: 534px;
        height: 42px;
    }
    .style7
    {
        width: 862px;
    }
    .style8
    {
        width: 862px;
        height: 42px;
    }
 
        .style9
        {
            width: 106px;
            height: 35px;
        }
        .style10
        {
            width: 108px;
            height: 35px;
        }
        .style11
        {
            height: 35px;
        }
 
        .auto-style1 {
            width: 197px;
            height: 35px;
        }
 
        .auto-style3 {
            width: 133px;
            height: 35px;
        }
        .auto-style5 {
            width: 209px;
            height: 35px;
        }
 
        #ddlExamnamehide {
            margin-bottom: 8px;
            margin-top: 9px;
        }
 
 </style>
    <asp:UpdatePanel ID="panelInactive" runat="server">
                <ContentTemplate>
                  <p align="center" style="margin-bottom: 7px">   <asp:Label ID="lblInactive" runat="server" Font-Bold="True" ForeColor="Green" style="font-family:Arial;"
            Text="List of Inactive Questions"  
            Font-Size="14pt"></asp:Label></p>
                    <p runat="server" id="ddlExamnamehide" align="center">
                        <strong>Exam Name: </strong>
                        <asp:DropDownList ID="ddlbindExamnames" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlbindExamnames_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Label ID="lblinactivequestions" runat="server" ForeColor="Green"></asp:Label>
                    </p>
                    <div align="center" style="margin:20px">           
                         <asp:GridView ID="gvInaciveQuestions" runat="server" AutoGenerateColumns="False" OnRowCommand="gvInaciveQuestions_RowCommand1" Height="188px" Width="973px" AllowPaging="True" OnPageIndexChanging="gvInaciveQuestions_PageIndexChanging" >
                <Columns>
                    <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnactive" runat="server"  Text="Active" CommandName="GenerateExecutive"  OnRowCommand="gvInaciveQuestions_RowCommand"  OnClientClick="return confirm('Are you sure want to Active this Question ?');" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  />
                            </ItemTemplate>
                        </asp:TemplateField>     
                    <asp:TemplateField HeaderText="Question">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuestion" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Option1">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOption1" runat="server" Text='<%# Bind("Option1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtOpttion1" runat="server" Text='<%# Bind("Option1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Option2">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOption2" runat="server" Text='<%# Bind("Option2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOption2" runat="server" Text='<%# Bind("Option2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Option3">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOption3" runat="server" Text='<%# Bind("Option3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOption3" runat="server" Text='<%# Bind("Option3") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Option4">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOption4" runat="server" Text='<%# Bind("Option4") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOption4" runat="server" Text='<%# Bind("Option4") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAnswer" runat="server" Text='<%# Bind("Answer") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAnswer" runat="server" Text='<%# Bind("Answer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="QuestionId">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuestionid" runat="server" Text='<%# Bind("QuestionId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuestionid" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   
                </Columns>
            </asp:GridView>
                        </div>

        </ContentTemplate>
    </asp:UpdatePanel>

 <asp:UpdatePanel ID="UpdateQuestions" runat="server">
 <ContentTemplate>

<div> 
 
<table class="gridtable" style="margin-top: 0px; height: 546px; width: 100%">
    <tr><th colspan="2" style="text-align:center;font-family:Arial;" >
        <asp:Label ID="lblsend" runat="server" Font-Bold="True" ForeColor="Green" 
            Text="Add Questions"  
            Font-Size="14pt"></asp:Label>
        </th></tr>
<tr id="hide" runat="server">

<td align="left" class="style5" colspan="2" ><center>
<fieldset style="height: 49px; margin-left: 102px; width:65%">
<legend style=" font-family: Arial; font-weight: bold; color: #008000;font-size:small; ">Add New Exam for Students</legend>
<table style="width: 730px" >
<tr>
<td class="auto-style3">Add New Exam</td>
<td class="style11"><asp:TextBox ID="txtNewexam" runat="server" MaxLength="20" Width="132px"></asp:TextBox></td>
<td class="auto-style5"><asp:RequiredFieldValidator ID="reqNewexam" runat="server" 
        ControlToValidate="txtNewexam" ErrorMessage="*" ForeColor="Red" 
        ValidationGroup="add"></asp:RequiredFieldValidator> <asp:RegularExpressionValidator ID="regnewexam" runat="server" 
        ControlToValidate="txtNewexam" ErrorMessage="Enter valid Examname" ForeColor="Red" 
        SetFocusOnError="True" ValidationExpression="^(?![ ])[.a-zA-Z][A-Za-z0-9#.+ ]*$" 
        ValidationGroup="add"></asp:RegularExpressionValidator>
    </td>
    <td class="style11">
        <asp:Button ID="btnAddSubject" runat="server" onclick="btnAddSubject_Click" 
        style="margin-left: 0px" Text="Add Exam" ValidationGroup="add"  Width="146px" /></td>
        <td class="auto-style1"><asp:Label ID="lblSucess" runat="server" ForeColor="Green" Visible="False"></asp:Label></td>
</tr>
</table>

   
    
    
    </fieldset>
    </center>
    </td>

    
    </tr>


<tr>
<td align="right" class="style5">Select Exam Name</td>
<td class="style7"> 
        <asp:DropDownList ID="ddlSubject" runat="server" AutoPostBack="True" Width="186px" Height="20px"
        onselectedindexchanged="ddlExamname_SelectedIndexChanged" 
            ValidationGroup="1" >
        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="ddlrequired" runat="server" 
                ErrorMessage="Required" InitialValue="--Select--" ForeColor="Red" 
                ControlToValidate="ddlSubject" ValidationGroup="valid"></asp:RequiredFieldValidator>
            <asp:Label ID="lblCurrent" runat="server" ForeColor="Green"></asp:Label>
           <br /> 
        </td>
</tr>
 
    


<tr>
	<td class="style5" align="right">
        <asp:Label ID="lblnewquestion" runat="server" Text="Question Name"></asp:Label>
    </td><td class="style7" >
        <asp:TextBox ID="txtQuestion" runat="server" Height="56px" TextMode="MultiLine"  onblur="return length()"
            Width="569px" style="resize:none;float:left" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="reqQuestion" runat="server" 
                ControlToValidate="txtQuestion" ErrorMessage="Required"  style="float:right;margin-right:95px" SetFocusOnError="true"    ForeColor="Red" ValidationGroup="valid"></asp:RequiredFieldValidator>

      
    </td>
</tr>
<tr><td class="style5" align="right">
    <asp:Label ID="Label2" runat="server" Text="Option1" ></asp:Label>
    </td>
	<td class="style7">
        <asp:TextBox ID="txtOption1" runat="server" Height="40px" TextMode="MultiLine" 
            Width="423px" style="resize:none;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqOption1" runat="server" SetFocusOnError="true" 
            ControlToValidate="txtOption1" ErrorMessage="Required" ForeColor="Red" 
            ValidationGroup="valid"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
	<td class="style5" align="right">
        <asp:Label ID="Label3" runat="server" Text="Option2"></asp:Label>
    </td><td class="style7">
        <asp:TextBox ID="txtOption2" runat="server" Height="40px" TextMode="MultiLine" 
            Width="425px"  style="resize:none;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqOption2" runat="server" 
            ControlToValidate="txtOption2" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="true" 
            ValidationGroup="valid"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
	<td class="style5" align="right">
        <asp:Label ID="Label4" runat="server" Text="Option3"></asp:Label>
    </td><td class="style7">
        <asp:TextBox ID="txtOption3" runat="server" Height="40px" TextMode="MultiLine" 
            Width="423px" style="resize:none;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqOption3" runat="server" 
            ControlToValidate="txtOption3" ErrorMessage="Required" ForeColor="Red" 
            ValidationGroup="valid" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
	<td class="style5" align="right">
        <asp:Label ID="Label6" runat="server" Text="Option4"></asp:Label>
    </td><td class="style7">
        <asp:TextBox ID="txtOption4" runat="server" Height="40px" TextMode="MultiLine" 
            Width="423px"  style="resize:none;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqOption4" runat="server" 
            ControlToValidate="txtOption4" ErrorMessage="Required" ForeColor="Red" 
            ValidationGroup="valid" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
	<td class="style5" align="right">
        <asp:Label ID="Label5" runat="server" Text="Answer"></asp:Label>
    </td><td class="style7">
        <asp:DropDownList ID="ddlsltAnswer" runat="server" Height="20px" Width="186px">
            <asp:ListItem>  --Select--</asp:ListItem>
            <asp:ListItem>Option1</asp:ListItem>
            <asp:ListItem>Option2</asp:ListItem>
            <asp:ListItem>Option3</asp:ListItem>
            <asp:ListItem>Option4</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="reqAnswer" runat="server" 
            ErrorMessage="Required" ForeColor="Red"  ControlToValidate="ddlsltAnswer" 
            InitialValue="--Select--" ValidationGroup="valid"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td class="style6" align="right" >
    </td><td class="style8" align="left">
    <asp:Button ID="btnSubmitQuestion" runat="server" Text="Submit Question" 
      style="margin-top: 1px; width: 145px;" 
        ValidationGroup="valid" onclick="btnSubmitQuestion_Click" />
    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click"  style="float:left;"
        Text="Update" ValidationGroup="valid" Visible="False" Width="143px" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"  Width="150px" Visible="False" style="margin-left:20px; " OnClientClick="return confirm('Are you sure want to Delete this Question ?');" />
    <asp:Label ID="lblError" runat="server" ForeColor="Green"></asp:Label>
    </td></tr>
</table>
     </div>
   
     <div style="margin-bottom:10px;margin-left:10px;margin-right:10px;" >
  <asp:GridView ID="gvShowQuestions" runat="server" AutoGenerateSelectButton="True" 
        onselectedindexchanged="gvShowQuestions_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvShowQuestions_PageIndexChanging"  BorderStyle="None" AutoGenerateColumns="False">
        <PagerSettings Position="TopAndBottom" />

         <Columns>
            <asp:TemplateField HeaderText="Question">
                <ItemTemplate>
                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtQuestiond" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Option1">
                <ItemTemplate>
                    <asp:Label ID="lblOption1" runat="server" Text='<%# Bind("Option1") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtOption1" runat="server" Text='<%# Bind("Option1") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Option2">
                <ItemTemplate>
                    <asp:Label ID="lblOption2" runat="server" Text='<%# Bind("Option2") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtOption2" runat="server" Text='<%# Bind("Option2") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Option3">
                <ItemTemplate>
                    <asp:Label ID="lblOption3" runat="server" Text='<%# Bind("Option3") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtOption3" runat="server" Text='<%# Bind("Option3") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Option4">
                <ItemTemplate>
                    <asp:Label ID="lblOption4" runat="server" Text='<%# Bind("Option4") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtOption4" runat="server" Text='<%# Bind("Option4") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Answer">
                <EditItemTemplate>
                    <asp:TextBox ID="txtAnswer" runat="server" Text='<%# Bind("Answer") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblAnswer" runat="server" Text='<%# Bind("Answer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="QuestionId" ControlStyle-CssClass="hideColumn" ItemStyle-CssClass="hideColumn" HeaderStyle-CssClass="hideColumn" />
            
            <asp:TemplateField HeaderText="hdExamname" Visible="false">
                 <ItemTemplate>
                    <asp:HiddenField ID="hdExamname" Value='<%# Bind("Examname") %>' runat="server" />
                </ItemTemplate>
         </asp:TemplateField>
            
        </Columns>






    </asp:GridView>
</div>
     
</ContentTemplate>
 </asp:UpdatePanel>

</asp:Content>

