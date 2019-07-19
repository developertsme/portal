using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_new_ticket : System.Web.UI.UserControl
{
    public string flag { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        flag = "";
        if (!this.IsPostBack)
        {
            loadData();
        }
    }
    private void loadData()
    {
        if (Request.QueryString["id"] != null)
        {
            DataRow dr = adata.get_acustomer(Request.QueryString["id"].ToString());
            if (dr == null)
            {
                dr = adata.get_ascustomer(Request.QueryString["id"].ToString());
                txtaccount_id.Value = dr["id"].ToString();
                txtname.Text = dr["name"].ToString();
                txtusername.Text = dr["username"].ToString();
                txtemail.Text = dr["email"].ToString();
                txtsurname.Text = dr["surname"].ToString();
                txtshippingAddress.Text = dr["shipping_address"].ToString();
                txtbillingAddress.Text = dr["billing_address"].ToString();
                flag = dr["country"].ToString();
                txttype.Text = dr["customer_type"].ToString(); ;
                txtcontact.Text = dr["tc_telephone"].ToString();
            }
            else
            {
                txtaccount_id.Value = dr["id"].ToString();
                txtname.Text = dr["firstname"].ToString();
                txtusername.Text = dr["username"].ToString();
                txtemail.Text = dr["email"].ToString();
                txtsurname.Text = dr["lastname"].ToString();
                txtshippingAddress.Text = dr["address1"].ToString() + " " + dr["state"].ToString() + " " + dr["zip"].ToString() + " " + dr["city"].ToString() + " ";
                txtbillingAddress.Text = dr["address2"].ToString();
                flag = dr["iso_code"].ToString();
                txttype.Text = dr["customer_type"].ToString(); ;
                txtcontact.Text = dr["tc_telephone"].ToString() + "-" + dr["telephone"].ToString();
            }
        }
    }

    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        /*SqlCommand cmd = new SqlCommand("insert into t_support_tickets (support_ticket_category_id,account_id,title) VALUES (@support_ticket_category_id,@account_id,@title)");
        cmd.Parameters.Add("@support_ticket_category_id", SqlDbType.VarChar).Value = txtcategory.SelectedValue;
        cmd.Parameters.Add("@account_id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = txttitle.Text;
        general.performAction(cmd);*/
    }
}