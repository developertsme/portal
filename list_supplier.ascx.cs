using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_list_supplier : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Repeater1.DataSource = general.getSet("select * from t_customersupplier where type='SUPPLIER'");
            Repeater1.DataBind();
        }
    }
}