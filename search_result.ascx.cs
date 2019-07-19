using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_search_result : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadCustomer();
            loadTickets();
        }
    }
    private void loadCustomer()
    {
        string term = Request.QueryString["term"].ToString().Trim().ToLower();
        SqlCommand cmd = new SqlCommand("select top 10 * from t_users where name like '%'+@search+'%' or email like '%'+@search+'%' order by id desc");
        cmd.Parameters.Add("@search", SqlDbType.VarChar).Value = term;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            lblerror.Text = general.myalert("Customer Records Found for <span style=\"color:#f00\">\"" + term.ToUpper() + " \" </span>: " + ds.Tables[0].Rows.Count);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
        else
        {
            lblerror.Text = general.myerror("No Data Found for: <span style=\"color:#f00\">\"" + term.ToUpper() + " \" </span> ");
        }
    }
    private void loadTickets()
    {
        string term = Request.QueryString["term"].ToString().Trim().ToLower();
        SqlCommand cmd = new SqlCommand("select top 10 id,title,UpdatedOn,account_id,uid,is_closed," +
            "(select top 1 name from t_support_ticket_categories where id=tbl.support_ticket_category_id) as category, " +
            "(select top 1 name+' '+surname+' '+ email from t_users where id=tbl.account_id) as customer " +
            "from t_support_tickets tbl where title like '%'+@search+'%' or id like '%'+@search+'%' or author_email like '%'+@search+'%' order by id desc");
        cmd.Parameters.Add("@search", SqlDbType.VarChar).Value = term;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            lblerror2.Text = general.myalert("Support Ticket Records Found for <span style=\"color:#f00\">\"" + term.ToUpper() + " \" </span>: " + ds.Tables[0].Rows.Count);
            Repeater2.DataSource = ds;
            Repeater2.DataBind();
        }
        else
        {
            lblerror2.Text = general.myerror("No Data Found for: <span style=\"color:#f00\">\"" + term.ToUpper() + " \" </span> ");
        }
    }
}