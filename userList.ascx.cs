using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sidetab2_userList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                DataRow dr = adata.get_ascustomer(Request.QueryString["id"].ToString());
                    txtname.Text = dr["name"].ToString();
                    txtusername.Text = dr["username"].ToString();
                    txtemail.Text = dr["email"].ToString();
                    txtsurname.Text = dr["surname"].ToString();
                    TextBox6.Text = dr["shipping_address"].ToString();
                    TextBox5.Text = dr["billing_address"].ToString();
                    txtcountry.SelectedValue = dr["country"].ToString();
                    txttype.Text = dr["customer_type"].ToString();
                txtcontact.Text = dr["tc_telephone"].ToString();

                txtcountry.DataSource = adata.get_allCountries();
                txtcountry.DataTextField = "name";
                txtcountry.DataValueField = "id";
                txtcountry.DataBind();
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("update t_users set country=@country,tc_telephone=@tc_telephone,customer_type=@customer_type," +
            "shipping_address=@shipping_address,billing_address=@billing_address where uid=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = txtcountry.SelectedValue;
        cmd.Parameters.Add("@tc_telephone", SqlDbType.VarChar).Value = txtcontact.Text;
        cmd.Parameters.Add("@customer_type", SqlDbType.VarChar).Value = txttype.Text;
        cmd.Parameters.Add("@shipping_address", SqlDbType.VarChar).Value = TextBox6.Text;
        cmd.Parameters.Add("@billing_address", SqlDbType.VarChar).Value = TextBox5.Text;
        general.performAction(cmd);
        Response.Redirect("website.aspx?page=userList&id=" + Request.QueryString["id"].ToString());
    }
}