﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="PDFViewer.ascx.vb" Inherits="PDFViewASP.WebUserControl1" %>
<%@ Register Assembly="StatefullScrollPanel" Namespace="CustomControls" TagPrefix="cc1" %>
<asp:Panel ID="MainPanel" runat="server" Height="100%" Width="100%" 
    Wrap="False" Enabled="False">
    <asp:Panel ID="ToolStripPanel" runat="server">
        <asp:Table ID="ToolStripTable" runat="server" CellPadding="5">
            <asp:TableRow ID="TableRow1" runat="server" VerticalAlign="Middle" HorizontalAlign="Left">
                <asp:TableCell ID="TableCell1" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:Label ID="PageLabel" runat="server" Text="Page 001 of 001" ></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:ImageButton ID="PreviousPageButton" runat="server" ImageUrl="images/Previous_24x24.png" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:ImageButton ID="NextPageButton" runat="server" ImageUrl="images/Next_24x24.png" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:Label ID="GoToLabel" runat="server" Text="Go to page" ></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:TextBox ID="PageNumberTextBox" runat="server" MaxLength="5" Width="35px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell ID="TableCell6" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:ImageButton ID="ZoomOutButton" runat="server" ImageUrl="images/Zoom Out_24x24.png" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell7" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:ImageButton ID="ZoomInButton" runat="server" ImageUrl="images/Zoom In_24x24.png" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell8" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:ImageButton ID="RotateCCButton" runat="server" ImageUrl="images/Undo_24x24.png" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell9" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:ImageButton ID="RotateCButton" runat="server" ImageUrl="images/Redo_24x24.png" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell10" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:Button ID="FitToScreenButton" runat="server" Text="Fit To Screen" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell11" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:Button ID="FitToWidthButton" runat="server" Text="Fit To Width" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell12" runat="server" VerticalAlign="Middle" HorizontalAlign="Center">
                    <asp:Button ID="ActualSizeButton" runat="server" Text="Actual Size" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Panel ID="PicPanel" runat="server" Height="100%">
            <asp:Table ID="Table1" runat="server" GridLines="Both" Height="100%" 
                style="margin-right: 0px" Width="100%">
                <asp:TableRow runat="server">
                    <asp:TableCell ID="BookmarkCell" runat="server" Width="25%" Height="100%">                       
                     <cc1:StatefullScrollPanel ID="BookmarkPanel" runat="server" ScrollBars="Auto" Width="250px" Height="700px">
                                                        <asp:Table ID="BookmarkTable" runat="server">
                            <asp:TableRow ID="BookmarkRow" runat="server">
                            <asp:TableCell ID="BookmarkContentCell"  runat="server" Width="100%" Height="100%"></asp:TableCell>
                            </asp:TableRow>
                            </asp:Table>
                        </cc1:StatefullScrollPanel>
                    </asp:TableCell>
                    <asp:TableCell ID="PicCell" runat="server"  Width="75%" Height="100%"><cc1:StatefullScrollPanel ID="ImagePanel" runat="server" ScrollBars="Auto" BackColor="Silver" Width="700px" Height="700px"><center><asp:Image ID="CurrentPageImage" runat="server" ImageAlign="Middle" /></center></cc1:StatefullScrollPanel></asp:TableCell>
                </asp:TableRow>
            </asp:Table></asp:Panel>
    </asp:Panel>
</asp:Panel>
<asp:HiddenField ID="HiddenPageNumber" runat="server" />
<asp:HiddenField ID="HiddenBrowserWidth" runat="server" />
<asp:HiddenField ID="HiddenBrowserHeight" runat="server" />
<asp:Button ID="HiddenPageNav" runat="server" Height="0px" Width="0px" BorderStyle="None" BackColor="Transparent" />
<script type="text/javascript">
function changePage(pageNum)
{
    getBrowserDimensions();
    document.getElementById("<%=HiddenPageNumber.ClientID%>").value = pageNum;
    document.getElementById("<%=HiddenPageNav.ClientID%>").click();
}

function getElement(aID)
{
   return (document.getElementById) ?
   document.getElementById(aID) : document.all[aID];
}

function getBrowserDimensions()
{
   if (typeof(window.innerWidth) == 'number') 
   {
      //Non-IE
      browserWidth = window.innerWidth;
      browserHeight = window.innerHeight;
   } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
      //IE 6+ in 'standards compliant mode'
      browserWidth = document.documentElement.clientWidth;
      browserHeight = document.documentElement.clientHeight;
   } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
      //IE 4 compatible
      browserWidth = document.body.clientWidth;
      browserHeight = document.body.clientHeight;
   }
   document.getElementById("<%=HiddenBrowserWidth.ClientID%>").value = browserWidth;
   document.getElementById("<%=HiddenBrowserHeight.ClientID%>").value = browserHeight;
}

</script>
<body onload="getBrowserDimensions();" />


