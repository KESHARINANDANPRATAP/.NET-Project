<%@ Page Title="" Language="C#" MasterPageFile="~/super.master" AutoEventWireup="true" CodeFile="~/ExamPattern.aspx.cs" Inherits="ExamPattern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        changebackcolor("exampattern");
    </script>
    <style>
        .hideColumn {
            display: none;
        }

        {
            display: none;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <p style="height: 25px; font-family: Arial; margin-bottom: 5px; text-align: center;">
                <asp:Label ID="lblsend" runat="server" Font-Bold="True" ForeColor="Green"
                    Text="Exam Pattern Details" Font-Size="14pt"></asp:Label>
            </p>


            <p style="margin-bottom: 9px">
            </p>

            <asp:Panel ID="Panel1" runat="server" Visible="False">

                <style type="text/css">
                    .margins {
                        margin-bottom: 30px;
                        margin-left: 30px;
                        margin-right: 30px;
                    }

                    .selectedrow {
                        background-color: #DEFE9F;
                    }
                </style>

                <table style="height: 83px; width: 862px;" align="center">

                    <tr>
                        <td colspan="2">
                            <asp:Label
                                ID="lblmandatory" Style="float: right; margin-right: 10px;"
                                runat="server" Font-Bold="False" ForeColor="Red" Text="(Mandatory fields *)"
                                Width="148px"></asp:Label>
                            <asp:Label ID="lblHead" runat="server" Font-Bold="True" Style="margin-left: 50px;"
                                Text="Update Exam Pattern Details"></asp:Label>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNew" runat="server" Text="Examname"></asp:Label>
                            :</td>
                        <td>
                            <asp:Label ID="lblLabel" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Number of Questions:<span style='color: red'>*</span> </td>
                        <td>
                            <asp:TextBox ID="txtNoofQuestions" runat="server" MaxLength="4"></asp:TextBox>
                            (Minimum 10 <strong>Questions</strong>)</td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="txtQuestions0" runat="server" ControlToValidate="txtNoofQuestions" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="Reqdigits2" runat="server" ControlToValidate="txtNoofQuestions" ErrorMessage="Only integers" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Time Duration(Minutes) :<span style="color: red">*</span></td>
                        <td>
                            <asp:TextBox ID="txtTime" runat="server" MaxLength="4"></asp:TextBox>
                            (Minimum 20 and Maximum 120 seconds per <strong>Question</strong>)</td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="reqTime0" runat="server" ControlToValidate="txtTime" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="Reqdigits3" runat="server" ControlToValidate="txtTime" ErrorMessage="Only integers" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Pass Marks:<span style="color: red">*</span> </td>
                        <td>
                            <asp:TextBox ID="txtPmarks" runat="server" MaxLength="4"></asp:TextBox>
                            (At Minmum Pass Marks 40% of <strong>Number of Questions</strong>)</td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="reqPmarks0" runat="server" ControlToValidate="txtPmarks" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="Reqdigits4" runat="server" ControlToValidate="txtPmarks" ErrorMessage="Only integers" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click"
                                Text="Update" ValidationGroup="1" Width="85px" />
                            <asp:Button ID="Cancel" runat="server" Style="margin-left: 0px;"
                                Text="Cancel" Width="72px" OnClick="btnDelete_Click" />
                        </td>
                        <td align="center" class="auto-style1">&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>

            <div>
                <center>
                    <p>
                        <asp:Label ID="lblshowcurrentqu" runat="server" ForeColor="Green"></asp:Label></p>
                </center>
            </div>
            <div>
                <center style="margin-bottom: 30px; margin-left: 30px; margin-right: 30px;">
                    <asp:GridView ID="gvExamPattern" runat="server" AutoGenerateColumns="False"
                        AutoGenerateSelectButton="True"
                        OnSelectedIndexChanged="gvExamPattern_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvExamPattern_PageIndexChanging" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Examid" ControlStyle-CssClass="hideColumn" ItemStyle-CssClass="hideColumn" HeaderStyle-CssClass="hideColumn" />
                            <asp:TemplateField HeaderText="Exam Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamname" runat="server" Text='<%# Bind("Examname") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Examname") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time Duration(In Minutes)">
                                <ItemTemplate>
                                    <asp:Label ID="lblTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Time") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pass Marks">
                                <ItemTemplate>
                                    <asp:Label ID="PassMarks" runat="server" Text='<%# Bind("PassMarks") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PassMarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number of Questions">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoofQuestions" runat="server" Text='<%# Bind("NumberofQuestions") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server"
                                        Text='<%# Bind("NumberofQuestions") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </center>
            </div>




        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

