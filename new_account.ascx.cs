using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_account : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            txtcountry.DataSource = adata.get_allCountries();
            txtcountry.DataTextField = "name";
            txtcountry.DataValueField = "id";
            txtcountry.DataBind();
        }
    }

    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into ats_users " +
            "(username,shortname,fullname,lastname,role,email,password,address,memid,branch,countryid,CreatedOn,CreatedBy) " +
            "OUTPUT inserted.id VALUES" +
            "(@username,@shortname,@fullname,@lastname,@role,@email,@password,@address,@memid,@branch,@countryid,GETDATE(),@CreatedBy)");
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
        Response.Redirect("website.aspx?page=accountsList&id=" + id);

    }
}