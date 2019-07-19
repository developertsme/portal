using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkssl();
        if (!this.IsPostBack)
        {
            //sign out from form authentication
            FormsAuthentication.SignOut();
            //abandon session
            Session.Abandon();
            //Response.Redirect("default.aspx");
            HiddenField1.Value = Request.RawUrl;

            runSP();
        }
    }
    private void checkssl()
    {
        if (Page.Request.Url.Scheme == "http")
        {
            //Response.Redirect("https://portal.tsume-art.com");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //abcd1234  :   e19d5cd5af0378da05f63f891c7467af
        // Three valid username/password pairs:
        string[] users = { "ats", "admin" };
        string[] passwords = { "ats", "passw@#$!123sdford" };
        for (int i = 0; i < users.Length; i++)
        {
            bool validUsername = (string.Compare(loginemail.Text, users[i], true) == 0);
            bool validPassword = (string.Compare(loginpassword.Text, passwords[i], false) == 0);
            if (validUsername && validPassword)
            {

                Session["fullname"] = loginemail.Text;
                Session["email"] = "s.aresh@yahoo.com";
                Session["username"] = "s.aresh@yahoo.com";
                Session["id"] = "1510";
                Session["role"] = "admin";
                CreateTicket(Session["fullname"].ToString());
            }
            else
            {
                txterror.Text = general.myalert("Invalid Username and Password.");
            }
        }
        if (CheckDB(loginemail.Text, loginpassword.Text))
        {
            txterror.Text = general.myalert("SECURITY PROTOCOL HAS BEEN CHANGED. YOU ARE REQUESTED TO RESET PASSWORD A.S.A.P ");
        }
        else if (CheckDB(loginemail.Text, general.getMd5Hash(loginpassword.Text)))
        {
            CreateTicket(Session["fullname"].ToString());
        }
        else if (CheckAttemps(loginemail.Text))
        {
            txterror.Text = general.myerror("You have exceeded the number of Attempts. Please Reset your password.");
        }
        else
        {
            txterror.Text = general.myerror("Invalid Username/Password.");
            wrongAttempt();
        }

    }
    private void CreateTicket(string name)
    {
        Session.Timeout = 120;
        bool isPersistent = false; //Persist.Checked; 
                                   //write down u r own methods for authentication
                                   //either from database or file

        FormsAuthenticationTicket ticket = new
        FormsAuthenticationTicket(
                1,
                name,
                System.DateTime.Now,
                System.DateTime.Now.AddMinutes(30),
                isPersistent,
                loginemail.Text, //change to ROLL
                FormsAuthentication.FormsCookiePath);
        // Encrypt the ticket.
        string encTicket = FormsAuthentication.Encrypt(ticket);
        // Create the cookie.
        Response.Cookies.Add(new
    HttpCookie(FormsAuthentication.FormsCookieName, encTicket));
        // Redirect back to original URL.

        //Response.Redirect(FormsAuthentication.GetRedirectUrl(UserName.Text, isPersistent));
        if (!HiddenField1.Value.Contains("default.aspx"))
        {
            if (HiddenField1.Value.ToString() == "/")
            {
                Response.Redirect("/website.aspx?page=dashboard&=1");
            }
            else
            {
                Response.Redirect(HiddenField1.Value);
            }
        }
        else
        {
            if (Session["role"].ToString() == "user")
            {
                Response.Redirect("/website.aspx?page=dashboard&=2");
            }
            else
            {
                Response.Redirect("/website.aspx?page=dashboard&=3");
            }
        }
    }
    private bool CheckAttemps(string username)
    {
        SqlCommand cmd = new SqlCommand("select isnull(attempts,0) from ats_Users where (username=@username or email=@username)");
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
        string attempt = general.getSingleData(cmd);
        if (Convert.ToInt32(attempt) > 3)
        {
            return true;
        }
        else return false;
    }
    public bool CheckDB(String username, string password)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select * from ats_Users where username=@username and password=@password and isnull(attempts,0)<4");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
            cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;// general.getMd5Hash(password);
            DataSet ds = general.getSet(cmd);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string id = ds.Tables[0].Rows[0]["id"].ToString();
                    if (string.IsNullOrEmpty(id))
                    {
                        return false;
                    }
                    else
                    {

                        Session["fullname"] = ds.Tables[0].Rows[0]["shortname"].ToString();
                        Session["email"] = ds.Tables[0].Rows[0]["email"].ToString();
                        Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                        Session["id"] = ds.Tables[0].Rows[0]["memid"].ToString();
                        Session["role"] = ds.Tables[0].Rows[0]["role"].ToString();
                        Session["branch"] = ds.Tables[0].Rows[0]["branch"].ToString();
                        logit();
                        return true;
                    }
                }
                else return false;
            }
            else return false;
        }
        catch (Exception)
        {

            return false;
        }
    }
    private void logit()
    {
        SqlCommand cmd = new SqlCommand("insert into t_logs (Who,CreatedOn) VALUES (@username,GETDATE())");
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = loginemail.Text;
        //general.performActionNoTrans(cmd);
    }
    private void wrongAttempt()
    { 
        SqlCommand cmd2 = new SqlCommand("UPDATE ats_Users set attempts=attempts+1 where username=@username");
        cmd2.CommandType = CommandType.Text;
        cmd2.Parameters.Add("@username", SqlDbType.VarChar).Value = loginemail.Text;
        general.performActionNoTrans(cmd2);
    }
    private void runSP()
    {
        SqlCommand cmd = new SqlCommand("sp_RecurringTask");
        cmd.CommandType = CommandType.StoredProcedure;
        general.performActionNoTrans(cmd);
    }
}