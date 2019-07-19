using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_supportDashboard : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadTickets();
            loadSummary();
        }
    }
    private void loadTickets()
    {
        SqlCommand cmd = new SqlCommand("select top 10 * from t_support_tickets where is_closed=0 order by CreatedOn Desc");
        Repeater1.DataSource = general.getSet(cmd);
        Repeater1.DataBind();

        SqlCommand cmd2 = new SqlCommand("select top 10 * from t_support_tickets where tag='Urgent' and is_closed=0 order by CreatedOn Desc");
        Repeater2.DataSource = general.getSet(cmd2);
        Repeater2.DataBind();
        
    }
    private void loadSummary()
    {
        SqlCommand cmd = new SqlCommand("sp_supportticket_dashboard");
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            Literal1.Text = dr["open"].ToString();
            Literal2.Text = dr["later"].ToString();
            Literal3.Text = dr["answer"].ToString();
            Literal4.Text = dr["waiting"].ToString();
            Literal5.Text = dr["new"].ToString();
            Literal6.Text = dr["last"].ToString();
            Literal7.Text = dr["urgent"].ToString();
            Literal8.Text = dr["noturgent"].ToString();
        }
        else
        {
            Literal1.Text = "0";
            Literal2.Text = "0";
            Literal3.Text = "0";
            Literal4.Text = "0";
            Literal5.Text = "0";
            Literal6.Text = "0";
            Literal7.Text = "0";
            Literal8.Text = "0";
        }
    }
}