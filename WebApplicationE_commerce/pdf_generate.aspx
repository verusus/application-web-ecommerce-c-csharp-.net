<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdf_generate.aspx.cs" Inherits="WebApplicationE_commerce.pdf_generate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 402px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="X-Large" NavigateUrl="~/Default.aspx">&lt;&lt;Go to Home Page</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Download Invoice" Font-Bold="True" Font-Size="X-Large" ForeColor="Silver" Height="49px" OnClick="Button1_Click" />
            <asp:Panel ID="Panel1" runat="server">
                <table border="1">
                    <tr>
                        <td style="text-align:center">
                            <h2 style="text-align:center">Retail invoice</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Order No:
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <br /><br />
                            Order Date:
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td class="auto-style1">
                                        Buyer Address: <br /><br />
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        Seller Address: <br /><br />
                                        av mohammadia bloc c Rés Riad 2, Tétouan 93000
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1000px">
                                <Columns>
                                    <asp:BoundField DataField="sno" HeaderText="SNo">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="productid" HeaderText="Product Id">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="productname" HeaderText="Product Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderText="Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Grand Total: 
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            This is a computer generated invoice and does not required signature.
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
