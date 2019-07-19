using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_logs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtcontent.Text = File.ReadAllText(Server.MapPath("~/log/log.txt")).Replace(System.Environment.NewLine, "<br/><br/>");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        File.WriteAllText(Server.MapPath("~/log/log.txt"), "--" + DateTime.Now.ToShortDateString() + " " + Session["username"].ToString() + "--");
        txtcontent.Text = File.ReadAllText(Server.MapPath("~/log/log.txt")).Replace(System.Environment.NewLine, "<br/><br/>");
    }
}