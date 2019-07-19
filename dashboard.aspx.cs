using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : System.Web.UI.Page
{
    public string compage { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

        logit();
        bool show = checkAck();
        if (show)
        {
            return;
        }
        try
        {
            compage = Request.QueryString["page"].ToString();
            Control cl = LoadControl("components/" + compage + ".ascx");
            this.PlaceHolder1.Controls.Add(cl);
            showmsg();
        }
        catch (Exception ex) 
        {

Response.Write("<!--" + ex.ToString() + "-->");
            //compage = "dashboard";
            //Control cl = LoadControl("components/" + compage + ".ascx");
            //this.PlaceHolder1.Controls.Add(cl);
        }
        if (!this.IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("default.aspx");
            }
        }
    }
    private void logit()
    {
        if (Request.QueryString["page"].ToString() != "livechart")
        { 
            SqlCommand cmd = new SqlCommand("insert into t_walk (Who,walk,CreatedOn) VALUES (@username,@walk,GETDATE())");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["fullname"].ToString();
            cmd.Parameters.Add("@walk", SqlDbType.VarChar).Value = Request.Url.ToString();
            //general.performActionNoTrans(cmd);
        }
    }
    private bool checkAck()
    {
        SqlCommand cmd2 = new SqlCommand("select * from ats_AKnow where assignTo=@username and didAck=0");
        cmd2.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"].ToString();
        DataSet dsack = general.getSet(cmd2);
        if (dsack.Tables.Count > 0)
        {
            if (dsack.Tables[0].Rows.Count > 0)
            {
                //Response.Redirect("dashboard.aspx?page=profile");
                compage = "profile";
                Control cl = LoadControl("components/" + compage + ".ascx");
                this.PlaceHolder1.Controls.Add(cl);
                return true;
            }
        }
        return false;
    }
    private void showmsg()
    {
        if (Session["role"].ToString() == "admin")
        {
            SqlCommand cmd = new SqlCommand("sp_desktop");
            cmd.CommandType = CommandType.StoredProcedure;
            string data = general.getSingleData(cmd);
            if (data.Length > 0)
            { 
            globalMsg.Text = generic.notify("'"+ data  + "'");
            }
        }
    }
}