using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_shop : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadUsers();
            loadCountries();
        }
    }
    private void loadUsers()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select top 50 uid,name + ' ' + surname as name from t_users order by id desc";
        txtcustomer.DataSource = general.getSet(cmd);
        txtcustomer.DataTextField = "name";
        txtcustomer.DataValueField = "uid";
        txtcustomer.DataBind();
    }
    private void loadCountries()
    {
        txtcountry.DataSource = adata.get_allCountries();
        txtcountry.DataTextField = "name";
        txtcountry.DataValueField = "id";
        txtcountry.DataBind();
    }

    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into t_shops " +
            "(userid,shopid,shopname,email,countryid,address,contactname,contactnum,contactname2,contactnum2,CreatedOn,CreatedBy) " +
            "OUTPUT inserted.id VALUES" +
            "(@userid,@shopid,@shopname,@email,@countryid,@address,@contactname,@contactnum,@contactname2,@contactnum2,GETDATE(),@username)");
        cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = txtcustomer.SelectedValue;
        cmd.Parameters.Add("@shopid", SqlDbType.VarChar).Value = txtwebsiteid.Text;
        cmd.Parameters.Add("@shopname", SqlDbType.VarChar).Value = txtshopname.Text;
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtemail.Text;
        cmd.Parameters.Add("@countryid", SqlDbType.VarChar).Value = txtcountry.SelectedValue;
        cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtaddress.Text;
        cmd.Parameters.Add("@contactname", SqlDbType.VarChar).Value = txtname1.Text;
        cmd.Parameters.Add("@contactnum", SqlDbType.VarChar).Value = txtcontact1.Text;
        cmd.Parameters.Add("@contactname2", SqlDbType.VarChar).Value = txtname2.Text;
        cmd.Parameters.Add("@contactnum2", SqlDbType.VarChar).Value = txtcontact2.Text;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"].ToString();
        string id = general.getSingleData(cmd);
        Response.Redirect("website.aspx?page=view_shop&id=" + id);

    }
}