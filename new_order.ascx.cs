using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_order : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadUsers();
        }
    }
    private void loadUsers()
    {
        SqlCommand cmd = new SqlCommand();
        if (Request.QueryString["id"] != null)
        {
            cmd.CommandText = "select uid,name + ' ' + surname as name from t_users where uid=@id";
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        }
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtcustomer.Text = dr["name"].ToString();
            txtcustomerid.Value = dr["uid"].ToString();
        }
    }

    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into t_orders " +
            "(account_id,note,note_shipping) " +
            "OUTPUT inserted.uid VALUES" +
            "(@account_id,@note,@note_shipping)");

        cmd.Parameters.Add("@account_id", SqlDbType.VarChar).Value = txtcustomerid.Value;
        cmd.Parameters.Add("@note", SqlDbType.VarChar).Value = txtnote.Text;
        cmd.Parameters.Add("@note_shipping", SqlDbType.VarChar).Value = txtshipnote.Text;
        string id = general.getSingleData(cmd);
        //txtscript.Text = "<script>jQuery(\"a[href = '#home2']\").click()</script>";
        Response.Redirect("website.aspx?page=view_order&id=" + id);
    }
}