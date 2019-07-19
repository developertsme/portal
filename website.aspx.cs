using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class website : System.Web.UI.Page
{
    public string compage { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            compage = Request.QueryString["page"].ToString();
            Control cl = LoadControl("components/" + compage + ".ascx");
            this.PlaceHolder1.Controls.Add(cl);
        }
        catch (Exception ex) 
        {

            Response.Write("<--" + ex.ToString() + "-->");
            compage = "dashboard";
            Control cl = LoadControl("components/" + compage + ".ascx");
            this.PlaceHolder1.Controls.Add(cl);
        }
        try
        {
            compage = Request.QueryString["page"].ToString();
            Control cl = LoadControl("sidetab1/" + compage + ".ascx");
            this.PlaceHolder2.Controls.Add(cl);
        }
        catch (Exception ex)
        {
            compage = "info";
            Control cl = LoadControl("sidetab1/" + compage + ".ascx");
            this.PlaceHolder3.Controls.Add(cl);
        }
        try
        {
            compage = Request.QueryString["page"].ToString();
            Control cl = LoadControl("sidetab2/" + compage + ".ascx");
            this.PlaceHolder3.Controls.Add(cl);
        }
        catch (Exception ex)
        {
        }
        try
        {
            compage = Request.QueryString["page"].ToString();
            Control cl = LoadControl("sidetab3/" + compage + ".ascx");
            this.PlaceHolder4.Controls.Add(cl);
        }
        catch (Exception ex)
        {
        }
        if (!this.IsPostBack)
        {
            if (Session["username"] == null)
            {
                //Response.Redirect("default.aspx");
            }
        }
    }
   
}