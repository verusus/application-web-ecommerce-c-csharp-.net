using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace WebApplicationE_commerce
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["RecordDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                string filepath = "images/" + FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Product values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + filepath + "', '" + TextBox4Price.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx");
            }else
            {
                label1.Text = "Please select a file";
            }
        }
    }
}