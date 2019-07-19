using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sidetab1_profile : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update t_tasks set status='COMPLETE' where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = lblid.Value;
        general.performAction(cmd);
        Response.Redirect("/website.aspx?page=profile");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update t_tasks set status='PENDING' where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = lblid.Value;
        general.performAction(cmd);
        Response.Redirect("/website.aspx?page=profile");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update t_tasks set status='TRANSFER' where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = lblid.Value;
        general.performAction(cmd);
        Response.Redirect("/website.aspx?page=profile");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update t_tasks set status='CLOSE' where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = lblid.Value;
        general.performAction(cmd);
        Response.Redirect("/website.aspx?page=profile");
    }
}