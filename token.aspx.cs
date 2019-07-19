using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Token : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select top 1 token from t_token where isUsed=0");
            string token = general.getSingleData(cmd);
            if (token.Length > 0)
            {
                SqlCommand cm = new SqlCommand("update t_token set isUsed=1 where token=@token");
                cm.Parameters.Add("@token", SqlDbType.VarChar).Value = token;
                general.performActionNoTrans(cm);
                Response.Write(token);
            }
            else
            {
                Response.Write(general.GetRandomPasswordUsingGUID(5));
            }
        }
    }
}