using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_supportticketlist : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadData();
        }
    }
    private void loadData()
    {
        SqlCommand cmd = new SqlCommand("select top 100 id,title,UpdatedOn,account_id,uid,is_closed," +
            "(select top 1 name from t_support_ticket_categories where id=tbl.support_ticket_category_id) as category, " +
            "(select top 1 name+' '+surname+' '+ email from t_users where id=tbl.account_id) as customer " +
            "from t_support_tickets tbl order by id desc");
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
        SqlCommand cmd = new SqlCommand("select top 100 id,title,UpdatedOn,account_id,uid,is_closed," +
            "(select top 1 name from t_support_ticket_categories where id=tbl.support_ticket_category_id) as category, " +
            "(select top 1 name+' '+surname+' '+ email from t_users where id=tbl.account_id) as customer " +
            "from t_support_tickets tbl where title like '%'+@search+'%' order by id desc");
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