using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Password : System.Web.UI.Page
{
    public string emailer { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string pass = general.GetRandomPasswordUsingGUID(8);
        updatePassword(pass);

        SqlCommand cmd = new SqlCommand("SELECT Password,isnull(Email,personalEmail) as Email from ats_Users WHERE email=@email or username=@email");
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = loginemail.Text;
        DataSet ds = general.getSet(cmd);
        try
        {
            emailer = ds.Tables[0].Rows[0]["Email"].ToString();
            if (emailer.Length < 5)
            {
                emailer = "s.aresh@yahoo.com";
            }
            if (pass.Length > 0)
            {
                txterror.Text = general.myalert("Password sent to your Email Address.");
                SendMail(pass);
            }
            else
            {
                txterror.Text = general.myalert("Invalid Email Address.");
            }
        }
        catch (Exception ex)
        {
            txterror.Text = general.myalert("Invalid Email Address.");
        }
    }
    private void updatePassword(string passwor)
    {
        SqlCommand cmd = new SqlCommand("UPDATE ats_Users set password=@password,attempts=0, UpdatedOn=GETDATE() WHERE email=@email or username=@email");
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = loginemail.Text;
        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = general.getMd5Hash(passwor);
        general.performAction(cmd);
    }
    public void SendMail(string pass)
    {
        general.sendMail(emailer, "New Password Request", getBody(pass), "");
    }
    public String getBody(string pass)
    {
        string body = adata.get_email_template("account_password_reset");

        body = body.Replace("{{name}}", loginemail.Text);
        body = body.Replace("{{password}}", pass);

        return body;
    }
}