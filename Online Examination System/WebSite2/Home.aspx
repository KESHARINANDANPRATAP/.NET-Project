<%@ Page Title="" Language="C#" MasterPageFile="~/super.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        changebackcolor("home");
    </script>
     <asp:Label ID="lblwellcome" runat="server" Font-Bold="True" Font-Size="14px" ForeColor="Green"></asp:Label>
    <div ><center>
        <asp:Image ID="ImgExam" style="align-content:center;image-orientation:auto" runat="server" Height="222px" ImageUrl="~/images/online-exam.jpg" Width="1116px" ToolTip="Online Exam" />
        </center>
    </div>
</asp:Content>

