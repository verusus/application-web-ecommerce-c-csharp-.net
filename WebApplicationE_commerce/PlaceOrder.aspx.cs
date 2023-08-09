using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationE_commerce
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["RecordDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection scon = new SqlConnection(str);
            scon.Open();
            SqlCommand cmd = new SqlCommand("insert into CardDetails(Fname,Lname,CardNo,ExpiryDate,CVV,BillingAddr) values('" + TextBox1.Text + "','"
             + TextBox2.Text + "','" + TextBox3.Text + "'," + TextBox4.Text + "," + TextBox5.Text + ",'" + TextBox6.Text + "');", scon);

            cmd.ExecuteNonQuery();
            scon.Close();
            Response.Write("<script>alert('Payment is successfully made');</script>");
            Session["address"] = TextBox6.Text;
            Response.Redirect("pdf_generate.aspx");
        }
    }
}