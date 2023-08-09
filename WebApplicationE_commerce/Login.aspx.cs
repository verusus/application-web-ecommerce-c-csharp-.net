using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplicationE_commerce
{
    public partial class Login : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["RecordDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink1.Visible = false;
            LinkButton1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Register where Email='"+TextBox1.Text+"' and Password='"+TextBox2.Text+"';", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(TextBox1.Text == "Admin" & TextBox2.Text == "123")
            {
                Label1.Text = "Admin login successfully";
                Label1.ForeColor = System.Drawing.Color.DarkGreen;

                
            }
            else if (dt.Rows.Count > 0)
            {
                Session["username"] = TextBox1.Text;
                Response.Redirect("Default.aspx");
                Label1.Text = "login successfully";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label1.Text = "login failed";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}