using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_user : System.Web.UI.UserControl
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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into t_users " +
            "(name,surname,email,tc_telephone,billing_address,shipping_address,username,country,customer_type,CreatedOn) " +
            "OUTPUT inserted.uid VALUES " +
            "(@name,@surname,@email,@contactno,@bill,@ship,@username,@country,@type,GETDATE());");
        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtname.Text;
        cmd.Parameters.Add("@surname", SqlDbType.VarChar).Value = txtsurname.Text;
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtemail.Text;
        cmd.Parameters.Add("@contactno", SqlDbType.VarChar).Value = txtno.Text;
        cmd.Parameters.Add("@bill", SqlDbType.VarChar).Value = txtbill.Text;
        cmd.Parameters.Add("@ship", SqlDbType.VarChar).Value = txtship.Text;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txtusername.Text;
        cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = txtcountry.SelectedValue;
        cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = txttype.SelectedValue;
        string id = general.getSingleData(cmd);
        Response.Redirect("website.aspx?page=view_user&id=" + id);
    }
}