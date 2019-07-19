using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_view_contact : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadContact();
        }
    }
    private void loadContact()
    {
        SqlCommand cmd = new SqlCommand("select * from t_contacts where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtfullname.Text = dr["fullname"].ToString().ToUpper();
            txtemail.Text = dr["email"].ToString();
            Literal1.Text = dr["jobtitle"].ToString().ToUpper();
            Literal2.Text = dr["phone"].ToString();
            Literal3.Text = dr["companyname"].ToString();
            Literal4.Text = "Size: " +dr["companysize"].ToString();
            Literal5.Text = dr["salessignup"].ToString().ToUpper();
            Literal6.Text = dr["address"].ToString();
            Literal7.Text = dr["countryid"].ToString();
            
        }
    }
}