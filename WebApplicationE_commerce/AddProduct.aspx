<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplicationE_commerce.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 510px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
        <table style="height:390px; width:700px; background-color:#5f98f3;" align="center">
            <tr>
                <td colspan="2" align="center" width="50%">
                    <h1>Adding Products</h1>
                </td>
                
            </tr>
            <tr>
                <td align="center" width="50%">
                    <h3>Product ID</h3>
                </td>
                <td width="50%">
                    <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td align="center" width="50%">
                    <h3>Product name</h3>
                </td>
                <td width="50%">
                    <asp:TextBox runat="server" ID="TextBox2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" width="50%">
                    <h3>Product description</h3>
                </td>
                <td  width="50%">
                    <asp:TextBox runat="server" ID="TextBox3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td  align="center" width="50%">
                    <h3>Product image</h3>
                </td>
                <td  width="50%">
                    <asp:FileUpload runat="server" ID="FileUpload1"></asp:FileUpload>
                </td>
            </tr>
            <tr>
                <td  align="center" width="50%">
                    <h3>Product price</h3>
                </td>
                <td width="50%">
                    <asp:TextBox runat="server" ID="TextBox4Price"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td  align="center" width="50%" colspan="2">
                    <asp:Button runat="server" Text="Add" ID="Button1" Font-Bold="True" ForeColor="Black" Height="36px" OnClick="Unnamed6_Click" Width="88px" />
                </td>
               
            </tr>
            <tr>
                <td  align="center" width="50%" colspan="2">
                    <asp:Label runat="server" ID="label1"></asp:Label>
                </td>
               
            </tr>


        </table>
    </div>
</asp:Content>
