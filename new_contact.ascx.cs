using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_contact : System.Web.UI.UserControl
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
        SqlCommand cmd = new SqlCommand("insert into t_contacts " +
            "(fullname, email, jobtitle, phone, companyname,companysize, salessignup,contactstatus,address,countryid,CreatedOn,CreatedBy) " +
            "OUTPUT inserted.id VALUES" +
            "(@fullname, @email, @jobtitle, @phone, @companyname,@companysize, @salessignup,@contactstatus,@address,@countryid,GETDATE(),@CreatedBy)");


        cmd.Parameters.Add("@fullname", SqlDbType.VarChar).Value = txtfullname.Text;
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtemail.Text;
        cmd.Parameters.Add("@jobtitle", SqlDbType.VarChar).Value = txtjobtitle.Text;
        cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = txtphone.Text;
        cmd.Parameters.Add("@companyname", SqlDbType.VarChar).Value = txtcompany.Text;
        cmd.Parameters.Add("@companysize", SqlDbType.VarChar).Value = txtcompanysize.Text;
        cmd.Parameters.Add("@salessignup", SqlDbType.VarChar).Value = txtsalessignup.Text;
        cmd.Parameters.Add("@contactstatus", SqlDbType.VarChar).Value = txtcontactstatus.Text;
        cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtaddress.Text;
        cmd.Parameters.Add("@countryid", SqlDbType.VarChar).Value = txtcountry.SelectedValue;
        cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = Session["username"].ToString();
        string ID = general.getSingleData(cmd);
        Response.Redirect("website.aspx?page=view_contact&id=" + ID);
    }
}