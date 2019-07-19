using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sidetab2_accountsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (txtpassword.Text != txtnewpassword.Text)
        {
            txtalert.Text = general.myerror("Password do not match");
            return;
        }
        SqlCommand cmd = new SqlCommand("Update ats_users set password=@password where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = general.getMd5Hash(txtpassword.Text);
        general.performAction(cmd);
        txtalert.Text = general.myalert("Password Change Successful");
        txtscript.Text = "<script>jQuery(\"a[href = '#messages']\").click()</script>";
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select * from ats_users where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            string newpass = general.GetRandomPasswordUsingGUID(6);
            DataRow dr = ds.Tables[0].Rows[0];
            string to = dr["email"].ToString();
            string body = adata.get_email_template("account_password_reset");
            SqlCommand cm = new SqlCommand("Update ats_users set password=@password where id=@id");
            cm.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
            cm.Parameters.Add("@password", SqlDbType.VarChar).Value = general.getMd5Hash(newpass);
            general.performAction(cm);


            body = body.Replace("{{name}}", dr["fullname"].ToString());
            body = body.Replace("{{password}}",newpass);
            general.sendMail("saharkiz@yahoo.com", "Tsume-Art Portal: Password Reset", body, "");

            txtalert.Text = general.myalert("Password Reset Email Sent Successful");
            txtscript.Text = "<script>jQuery(\"a[href = '#messages']\").click()</script>";
        }
    }
}