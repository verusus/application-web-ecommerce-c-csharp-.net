<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationE_commerce.Login"  MasterPageFile="~/Default.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div>
            <table style="width: 1150px; height:30px;">
             <tr style="background-color:#00CC99">
                 <td colspan="2" style="text-align:right">
                    <asp:Label ID="Label4" runat="server" style="text-align:left" Font-Bold="True" Font-Italic="True"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/Login.aspx">Click to Login</asp:HyperLink>
                     <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Register.aspx">Register</asp:LinkButton>
                </td>
        </tr>
    </table>
        </div>
    <table align="center" class="auto-style1" style="background-color: #00CC99">
        <tr>
            <td colspan="2" align="center"> <h2>Login Page</h2></td>
            
        </tr>
        <tr>
            <td><b>Email</b></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="51px" Width="340px" TextMode="Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><b>Password</b></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="51px" Width="340px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">

                <asp:Button ID="Button1" runat="server" Height="50px" Text="Login" Width="128px" OnClick="Button1_Click" />

                <br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>

            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
 </asp:Content>