using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sidetab1_userList : System.Web.UI.UserControl
{
    public string flag { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            flag = "";
            if (Request.QueryString["id"] != null)
            {
                DataRow dr = adata.get_ascustomer(Request.QueryString["id"].ToString());
                Literal1.Text = dr["name"].ToString();
                Literal3.Text = dr["username"].ToString();
                Literal4.Text = dr["email"].ToString();
                Literal2.Text = dr["surname"].ToString();
                Literal6.Text = dr["shipping_address"].ToString();
                Literal5.Text = dr["billing_address"].ToString();
                flag = dr["country"] == DBNull.Value ? "" :  dr["country"].ToString();
                txtcontact.Text = dr["tc_telephone"].ToString();
            }
        }
        else
        {
            flag = "";
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("website.aspx?page=view_user&id=" + Request.QueryString["id"].ToString());
    }
}