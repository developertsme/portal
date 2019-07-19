using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_view_account : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadUser(); 
            
        }
    }
    private void loadUser()
    {
        txtcountry.DataSource = adata.get_allCountries();
        txtcountry.DataTextField = "name";
        txtcountry.DataValueField = "id";
        txtcountry.DataBind();

        SqlCommand cmd = new SqlCommand("select * from ats_users where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtusername.Text = dr["username"].ToString();
            txtshort.Text = dr["shortname"].ToString();
            txtfullname.Text = dr["fullname"].ToString();
            txtlastname.Text = dr["lastname"].ToString();
            txtemail.Text = dr["email"].ToString();
            txtmemid.Text = dr["memid"].ToString();
            txtbranch.Text = dr["branch"].ToString();
            txtaddress.Text = dr["address"].ToString();
            txtrole.SelectedValue = dr["role"].ToString();
            txtcountry.SelectedValue = dr["countryid"].ToString();
        }
    }
    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("update ats_users SET " +
            "username=@username,shortname=@shortname,fullname=@fullname,lastname=@lastname,role=@role,email=@email," +
            "password=@password,address=@address,memid=@memid,branch=@branch,countryid=@countryid,UpdatedOn=GETDATE(),UpdatedBy=@CreatedBy " +
            "where id=@id");

        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txtusername.Text;
        cmd.Parameters.Add("@shortname", SqlDbType.VarChar).Value = txtshort.Text;
        cmd.Parameters.Add("@fullname", SqlDbType.VarChar).Value = txtfullname.Text;
        cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = txtlastname.Text;
        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = txtrole.SelectedValue;
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtemail.Text;
        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = general.getMd5Hash(txtpassword.Text);
        cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtaddress.Text;
        cmd.Parameters.Add("@memid", SqlDbType.VarChar).Value = txtmemid.Text;
        cmd.Parameters.Add("@branch", SqlDbType.VarChar).Value = txtbranch.Text;
        cmd.Parameters.Add("@countryid", SqlDbType.VarChar).Value = txtcountry.SelectedValue;
        cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = Session["username"].ToString();
        string id = general.getSingleData(cmd);
        Response.Redirect("website.aspx?page=accountsList&id=" + Request.QueryString["id"].ToString());

    }
}