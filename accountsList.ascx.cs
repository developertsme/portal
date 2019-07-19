using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sidetab1_accountsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                DataRow dr = adata.get_asaccount(Request.QueryString["id"].ToString());
                Literal1.Text = dr["fullname"].ToString();
                Literal2.Text = dr["lastname"].ToString();
                Literal3.Text = dr["username"].ToString();
                Literal4.Text = dr["email"].ToString();
                Literal5.Text = dr["Company"].ToString();
                Literal6.Text = dr["shortname"].ToString();
                Literal7.Text = dr["branch"].ToString();
                Literal8.Text = dr["role"].ToString();
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("website.aspx?page=view_account&id=" + Request.QueryString["id"].ToString());
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("delete from ats_users where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        general.performAction(cmd);
        Response.Redirect("website.aspx?page=accountsList");
    }
}