using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationE_commerce
{
    public partial class Default1 : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["RecordDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";


            // login session

            if (Session["username"] != null)
            {
                Label4.Text = "logged in as " + Session["username"].ToString();
                HyperLink1.Visible = false;
                Button1.Visible = true;
            }
            else
            {
                Label4.Text = "You can login here! ";
                HyperLink1.Visible = true;
                Button1.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
            Label4.Text = "You have logged out successfully";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Product where (Pname like '%" + TextBox1.Text + "%') or  (ProductId like '%" + TextBox1.Text + "%')", con);
            DataTable dt = new DataTable();      //here it might be the Session["buyitems"] !!!
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;  
            DataList1.DataBind();
            con.Close();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Product where (Pname like '%" + TextBox1.Text + "%') or  (ProductId like '%" + TextBox1.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
            con.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName == "AddToCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
            }
        }

       
    }
}