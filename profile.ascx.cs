using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_profile : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadUser();
            loadTask();
        }
    }
    private void loadTask()
    {
        SqlCommand cmd = new SqlCommand("select * from t_tasks where assignTo=@username and status <> 'CLOSE'");
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"].ToString();
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
    }
    private void loadUser()
    {
        SqlCommand cmd = new SqlCommand("select * from ats_users where username=@username");
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"].ToString();
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txtfullname.Text = dr["fullname"].ToString();
            txtemail.Text = dr["email"].ToString();
            txtaccountid.Text = dr["memid"].ToString();
            txtcategory.Text = dr["role"].ToString();
            fusername.Value = dr["username"].ToString();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (txtnew.Text == txtretype.Text)
        { 
        SqlCommand cmd = new SqlCommand("Update ats_users set password=@newpassword where username=@username and password=@current");

        cmd.Parameters.Add("@current", SqlDbType.VarChar).Value = general.getMd5Hash(txtcurrent.Text);
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"].ToString();
        cmd.Parameters.Add("@newpassword", SqlDbType.VarChar).Value = general.getMd5Hash(txtnew.Text);
        bool saved = general.performAction(cmd);
            if (saved)
            {
                txtlabel.Text = general.myLabel("Password Change Successful");
            }
            else
            {
                txtlabel.Text = general.myerror("Current Password does not match.");
            }
        }
        else
        {
            txtlabel.Text = general.myerror("New Password and Re-Type Password do not match");
        }
    }
}