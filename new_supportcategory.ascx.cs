using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_supportcategory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadCategories();
        }
    }
    private void loadCategories()
    {
        txtparent.DataSource = general.getSet("select * from t_support_ticket_categories");
        txtparent.DataTextField = "name";
        txtparent.DataValueField = "id";
        txtparent.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into t_support_ticket_categories (parent_id,name,CreatedOn,UpdatedOn) " +
            "VALUES (@parentid,@name,GETDATE(),GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = txtparent.SelectedValue;
        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtname.Text;
        general.performAction(cmd);
        Response.Redirect("");
    }
}