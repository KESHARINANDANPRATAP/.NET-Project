<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" CodeFile="~/Studentexam.aspx.cs"   AutoEventWireup="true" Inherits="Studentexam" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
      <h5> <p style="margin-bottom: 6px">  WELCOME&nbsp; :<asp:Label ID="lblusername" runat="server" Text="name"></asp:Label>    
    <asp:LinkButton ID="btnlinksignout" runat="server" style="float:right; margin-right:20px;text-decoration:none;font-family:Arial;" 
        onclick="btnlinksignout_Click" Width="78px" Font-Size="11pt" Height="19px">Sign out</asp:LinkButton></p></h5>

<div>
<center>
    <asp:Button ID="srtbutton" runat="server" Text="Start Exam" Height="34px" 
            Width="343px" onclick="srtbutton_Click" Visible="False" />
    <asp:Label ID="lblQuestions" runat="server" ForeColor="Red" 
        Text="Questions not Prepared Yet....." Visible="False"></asp:Label>
   </center>
</div>

<div>
  <asp:UpdatePanel ID="updpanel" runat="server">
            <ContentTemplate>
            
            <p style="margin-left:781px; width: 134px; height: 59px; margin-bottom: 22px;">   
            <asp:Label ID="lbltleft" runat="server" ForeColor="Red" Text="Time Left :" 
                    Visible="False"></asp:Label> <asp:Label ID="lblMin" runat="server" 
                    Text="00" Visible="False"></asp:Label>
                <asp:Label ID="lblSec"
        runat="server" Text=": 00" Visible="False"></asp:Label>
        <asp:Timer ID="Tset" runat="server" Enabled="False" Interval="1000" ontick="Tset_Tick" 
          >
        </asp:Timer>
                
                &nbsp;</p>
            <div>

<asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Height="68px" 
        Width="912px" style="margin-top: 44px; margin-left:20px;">
<asp:Label ID="lblQuestion" runat="server" Font-Bold="True"></asp:Label>
	</asp:Panel>

 <asp:Panel ID="panel3" runat="server" ScrollBars="Auto" Height="172px"  style="margin-left:20px;"
        Width="909px">
    <asp:RadioButtonList ID="rblOptions" runat="server" Font-Bold="True" 
         Height="27px" onselectedindexchanged="rblOptions_SelectedIndexChanged">
    
    </asp:RadioButtonList>
	 </asp:Panel>
     
     <table style="height: 20px; width: 100%">
     <tr>
     <td ><div style="margin-left:169px">
         <asp:Button ID="btnPrevious" runat="server" Text="Previous Quesion" 
             style="margin-left: 0px" onclick="btnPrevious_Click" Visible="False" /></div>
     </td>
     <td>
         &nbsp;</td>
<td>
      <div style="position:relative">   
          <asp:Button ID="btnNextquestion" runat="server" Text="Nex Question" 
             onclick="btnNextquestion_Click" Width="133px" Visible="True" /></div>
         <asp:Label ID="lblerror" runat="server" Visible="False"></asp:Label>
         </td></tr>
         
    </table>
    

 
 <tr><td colspan=3><center><asp:Button ID="btnfinish" runat="server" Text="Finish" 
                     onclick="btnfinish_Click" Visible="False" Width="101px" OnClientClick="return checksubmit()"/></center></td></tr>


</div>
            
            </ContentTemplate>
            </asp:UpdatePanel> 
</div>

 
</asp:Content>

