using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_customersprolist : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadData();

            if (Request.QueryString["id"] != null)
            {
                txtscript.Text = "<script>showright();</script>";
            }
        }
    }
    private void loadData()
    {
        SqlCommand cmd = new SqlCommand("select top 100 * from view_PRO_customers order by id desc");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string term = txtsearch.Text.Trim().ToLower();
        SqlCommand cmd = new SqlCommand("select top 100 * from view_PRO_customers where name like '%'+@search+'%' or email like '%'+@search+'%' order by id desc");
        cmd.Parameters.Add("@search", SqlDbType.VarChar).Value = term;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            lblerror.Text = general.myalert("Records Found for <span style=\"color:#f00\">\"" + term.ToUpper() + " \" </span>: " + ds.Tables[0].Rows.Count);
            txtsearch.Text = "";
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
        else
        {
            lblerror.Text = general.myerror("No Data Found for: <span style=\"color:#f00\">\"" + term.ToUpper() + " \" </span> ");
        }
    }
}