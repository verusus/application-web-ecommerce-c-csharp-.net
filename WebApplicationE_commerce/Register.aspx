<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplicationE_commerce.Register"  MasterPageFile="~/Default.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="auto-style7" style="background-color: #00CC99" >
        <tr>
            <td colspan="2" align="center" class="auto-style5"><h2 class="auto-style4">Registration Page</h2></td>
            
        </tr>
        <tr>
            <td class="auto-style11" >First Name</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox1" runat="server" Height="50px" Width="321px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="first name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="only caracters are accepted in first name" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
           <td class="auto-style8" >Last Name</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="50px" Width="321px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="last name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="only caracters are accepted in last name" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style11" >Email_ID</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox3" runat="server" Height="50px" Width="321px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
        <tr>
            <td class="auto-style9" >Gender</td>
            <td class="auto-style10">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="324px">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="gender is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" >Addresse</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Height="50px" Width="321px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="address is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" >Phone</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Height="50px" Width="321px" TextMode="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="phone is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" Display="None" ErrorMessage="invalid phone number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" >Password</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Height="50px" Width="321px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
           <td class="auto-style11" >Confirm password</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox7" runat="server" Height="50px" Width="321px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" ErrorMessage="comfirm password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" Display="None" ErrorMessage="passwords are not the same"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button1" runat="server" Text="Register" Font-Bold="True" Font-Size="Large" Height="36px" Width="145px" OnClick="Button1_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
           <td colspan="2" align="center" >
               <asp:Label ID="Label1" runat="server" ForeColor="Yellow"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        
    </table>
        <div>
        </div>
   
     </asp:Content>