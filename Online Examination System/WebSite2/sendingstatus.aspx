<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true"    CodeFile="~/sendingstatus.aspx.cs" Inherits="sendingstatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        changebackcolor("sendmail");

    </script>
    <asp:UpdatePanel ID="updatepanelsendingstatus" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 766px; height: 20px;text-align:right">
                       
                            <asp:Label ID="lblsend" runat="server" Font-Bold="True" ForeColor="Green" Text="Sending Mails to Students who  Qualified for the Exam"
                                 Font-Size="14pt" Height="24px"></asp:Label>
                            <asp:Label ID="lblsent" runat="server" Font-Bold="True" ForeColor="Green" 
                                Text="All Sent Mails" Visible="False" Font-Size="14pt"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:LinkButton ID="btnsent" runat="server" onclick="btnsent_Click" 
                            Width="116px" style="margin-left: 0px" Height="19px" ToolTip="View Already Sent Mails">View Sent Mails</asp:LinkButton>
                        <asp:LinkButton ID="btnSendback" runat="server" onclick="btnSendback_Click1" 
                            Visible="False" Width="153px" ToolTip="Back To Send Mails to Students" style="height: 19px">Back to Sending Mails</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pancontrols" runat="server" Width="100%">
                <center>
                    <table style="height: 266px; width: 75%;" >
                        <tr> 

                            <td  colspan="3">
                                <asp:Label ID="lbldisplaysubhead" runat="server" Text=" Filter By Conducted Exam Date or Exam name or Above Pass Marks " ForeColor="Green"></asp:Label>
                            </td>

                        </tr>

                        <tr>
                            <td align="left" class="style3" style="width: 188px; ">
                                Conducted Exam Date :
                            </td>
                            <td align="left" style="width: 225px; " class="style3">
                                <asp:TextBox ID="txtDate" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/images/cal.jpg"
                                    OnClick="btnImg_Click" Width="40px" />
                                <br />
                            </td>
                            <td align="left"  style="overflow:auto;display:inline-block; white-space:nowrap; width:184px; height: 42px;" >
                        
                            </td>
                        </tr>
                        <tr id="trcal" runat="server"><td colspan="3" >        <asp:Calendar ID="calSelectdate" runat="server" OnSelectionChanged="calSelectdate_SelectionChanged"
                                    Visible="False"></asp:Calendar></td></tr>
                        <tr>
                            <td align="left" class="style2" style="width: 188px; height: 13px;">
                                &nbsp;&nbsp;&nbsp; Filter By Exam Name:
                            </td>
                            <td align="left" style="width: 225px; height: 13px;">
                                <asp:DropDownList ID="ddlexamname" runat="server" OnSelectedIndexChanged="ddlexamname_SelectedIndexChanged" Width="150px"
                                    AutoPostBack="True" ValidationGroup="enter">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 39px; width: 188px;">
                                Enter who Got Above Marks:
                            </td>
                            <td align="left" style="width: 225px; height: 39px;">
                                <asp:TextBox ID="txtAboveMarks" runat="server" Style="margin-bottom: 0px" Height="21px"
                                    MaxLength="3" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqgotabove0" runat="server" ControlToValidate="txtAboveMarks"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="enter"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reqMarksabove" runat="server" ErrorMessage="Only integers"
                                    ValidationExpression="\d+" ControlToValidate="txtAboveMarks" ForeColor="Red"
                                    ValidationGroup="enter"></asp:RegularExpressionValidator>
                            </td>
                            <td style="width: 184px; height: 39px;">
                                <asp:Button ID="btnfilter" runat="server" OnClick="btnFilter_Click" Style=" float:left;
                                    margin-bottom: 2px;" Text="Filter Students" ValidationGroup="enter" Width="110px" />
                                <asp:Button ID="btnclear" runat="server" Text="clear" Width="96px"  Style="    float:right;           margin-right: 2px;" CausesValidation="False" OnClick="btnclear_Click"/>
                            </td>
                        </tr>
                    </table>
                </center>
            </asp:Panel>
            <center>
                <asp:Label ID="lblnorows" runat="server" ForeColor="Red"></asp:Label>
            </center>
            <div>
            
                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="True" OnCheckedChanged="chkAll_CheckedChanged"
                    Style="padding: 70px; margin-left:120px" Text="Select All Mails" Visible="False" Font-Bold="True" />
                <asp:GridView ID="gvStudentMarks" runat="server" Width="953px" Style="margin-left: 120px;margin-bottom:30px;" AllowPaging="True" OnPageIndexChanging="gvStudentMarks_PageIndexChanging" PageSize="5">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelect_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <tr>
                    <td class="style6">
                        <asp:Label ID="tomails" runat="server" Style="margin-left: 40px"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="txtTo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="panelbody" runat="server" Visible="False">
                            <table cellpadding="5px" cellspacing="0px">
                                <tr>
                                    <td align="right" class="style6">
                                        Subject:
                                    </td>
                                    <td class="style19">
                                        <asp:TextBox ID="txtSubject" runat="server" Height="29px" Width="426px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqSubject" runat="server" ControlToValidate="txtSubject"
                                            ErrorMessage="Required" ForeColor="Red" ValidationGroup="mail"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td class="style6" align="right">
                                        Body:
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="txtBody" runat="server" Height="92px" Width="425px" TextMode="MultiLine"
                                            Style="resize: none; margin-bottom: 1px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqBody" runat="server" ControlToValidate="txtBody"
                                            ErrorMessage="Required" ForeColor="Red" ValidationGroup="mail"></asp:RequiredFieldValidator>
                             <div style="float:right">
     <asp:UpdateProgress ID="updProgress" AssociatedUpdatePanelID="updatepanelsendingstatus" runat="server">
                                <ProgressTemplate>
<img alt="progress" width="150px" height="30px" src="images/progressbarset.gif"/>
<strong>Sending...</strong>
</ProgressTemplate>
</asp:UpdateProgress>
</div>                                    

                                    </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td class="style13">
                                    </td>
                                    <td class="style18">
                                        <asp:Button ID="btnSendmail" runat="server" OnClick="btnSendmail_Click" Text="Send Mail"
                                            Width="141px" ValidationGroup="mail" />
                                        <asp:Label ID="lblsuccess" runat="server" ForeColor="Green"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                         





                        </asp:Panel>
                    </td>
                </tr>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
