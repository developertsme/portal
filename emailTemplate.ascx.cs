using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_emailTemplate : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                SqlCommand cmd = new SqlCommand("select * from ats_mailtemplate where id=@id");
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
                DataSet ds = general.getSet(cmd);
                RadEditor1.Content = ds.Tables[0].Rows[0]["template"].ToString();
                TextBox1.Text = ds.Tables[0].Rows[0]["key"].ToString();
                txtscript.Text = "<script>jQuery(\"a[href = '#home2']\").click()</script>";
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM ats_mailTemplate WHERE ID=@ID");
        cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = TextBox2.Text;
        general.performAction(cmd);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            SqlCommand cmd = new SqlCommand("UPDATE ats_mailTemplate SET template=@template, [key]=@key where id=@id");

            cmd.Parameters.Add("@template", SqlDbType.VarChar).Value = RadEditor1.Content;
            cmd.Parameters.Add("@key", SqlDbType.VarChar).Value = TextBox1.Text;
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
            general.performAction(cmd);
        }
        else
        { 
            SqlCommand cmd = new SqlCommand("insert into ats_mailTemplate(template,[key]) VALUES (@template,@key)");

            cmd.Parameters.Add("@template", SqlDbType.VarChar).Value = RadEditor1.Content;
            cmd.Parameters.Add("@key", SqlDbType.VarChar).Value = TextBox1.Text;
            general.performAction(cmd);
        }
    }

    protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        RadGrid1.DataSource = general.getSet("select [Key],ID from ats_mailTemplate order by id desc");

    }

    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        string a = e.CommandName;
        string b = e.CommandArgument.ToString();
        if (a == "View")
        {
            Response.Redirect("website.aspx?page=emailTemplate&id=" + b);
        }
    }
}