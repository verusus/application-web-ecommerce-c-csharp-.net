<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="WebApplicationE_commerce.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" style="margin-top:50px; width:531px; height:563px;" bgcolor="DarkCyan">
                <tr>
                    <td colspan="2" align="center" style="vertical-align:top">
                        <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" ToolTip="Card Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top" align="center">
                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" placeholder="First Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is empty" ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="First Name must be in characters" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                    </td>
                    <td style="vertical-align:top" align="center">
                        <asp:TextBox ID="TextBox2" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" placeholder="Last Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is empty" ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Last Name must be in characters" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr >
                    <td colspan="2" align="center">
                        <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderWidth="2px" ImageUrl="~/images/visa_paypal_mastercard.png" Width="438px" />
                    </td>
                </tr>
                <tr colspan="2" align="center">
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Card Number" Font-Bold="True" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox3" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Height="44px" Width="442px" placeholder="16 Digits"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Card Number is empty" ControlToValidate="TextBox3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Card Number must be a 16 digits number" ControlToValidate="TextBox3" ForeColor="Red" ValidationExpression="[0-9]{16}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label3" runat="server" Text="Expiration Date" Font-Bold="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="Label4" runat="server" Text="CVV" Font-Bold="True" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox4" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" placeholder="MM/YY(Eg:062000)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Expiration Date is empty" ControlToValidate="TextBox4" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox5" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" placeholder="3 Digits"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="CVV is empty" ControlToValidate="TextBox5" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="CVV must be a 3 digits number" ControlToValidate="TextBox5" ForeColor="Red" ValidationExpression="[0-9]{3}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox6" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="X-Large" Height="50px" Width="188px" placeholder="Billing Address" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address is empty" ControlToValidate="TextBox6" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="Black" BorderColor="White" BorderWidth="2px" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="44px" Width="188px" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" HeaderText="Fix the following errors" />
                    </td>
                </tr>
                <tr  colspan="2">
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/AddToCart.aspx">&lt;Previous Page</asp:HyperLink>
                    </td>
                    <td class="auto-style1">
                      <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" NavigateUrl="~/Default.aspx">Home Page&gt;</asp:HyperLink>
                     </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
