using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplicationE_commerce
{
    public partial class AddToCart : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["RecordDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["buyitems"] == null)   // if cart is emty then execute this
                {
                    Button1.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                }

                //Adding product to grid view 
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("ptotalprice");

                if (Request.QueryString["id"] != null) 
                {
                    if (Session["buyitems"] == null)   // if cart is emty then execute this &&& look where is this session
                    {
                        dr = dt.NewRow();

                        SqlConnection con = new SqlConnection(str);
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter("select * from Product where ProductId='" + Request.QueryString["id"]+"';", con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount: ";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        con.Close();
                        Response.Redirect("AddToCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlConnection con = new SqlConnection(str);
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter("select * from Product where ProductId='" + Request.QueryString["id"] + "';", con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount: ";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        con.Close();
                        Response.Redirect("AddToCart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount: ";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                    }
                    
                }
            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session["Orderdate"] = OrderDate;
            orderid();

            
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while(i < nrow)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());
                i = i + 1;
            }
            return totalprice;
        }

         public void orderid()
        {
            String alpha = "abCdefghIjklmNopqrStuvwXyz123456789";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            String orderid;
            orderid = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() +
                DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() +
                new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int sr;  //serial number in a row
                int sr1;
                string qdata;
                string dtdata;

                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];   //table cell of the selected row
                qdata = cell.Text;
                dtdata = sr.ToString();  //no meaning!!!!!!
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Item Has Been Deleted From Shopping Cart
                    break;
                }
            }


            // 5.Setting SNo. after deleting Row item from cart

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["buyitems"] = dt;      // updating our session
            Response.Redirect("AddToCart.aspx");   // return to the same page

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                SqlConnection scon = new SqlConnection(str);
                scon.Open();
                SqlCommand cmd = new SqlCommand("insert into OrderDetails(orderid,sno,productid,productname,price,quantity,orderdate) values('" + Session["Orderid"] + "',"
                 + dt.Rows[i]["sno"] + "," + dt.Rows[i]["pid"] + ",'" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"] + "," + dt.Rows[i]["pquantity"] + ",'" + Session["Orderdate"] + "')", scon);

                cmd.ExecuteNonQuery();
                scon.Close();
            }


            //If Session is Null Redirecting to login else Placing the order
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (GridView1.Rows.Count.ToString() == "0")
                {
                    Response.Write("<script> alert('Your Cart is Empty. You cannot place an Order');</script>");

                }
                else
                {
                    Response.Redirect("PlaceOrder.aspx");

                }
            }
        }
    }
}