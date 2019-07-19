using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class components_serviceapi : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            loadTokens();
        }
    }
    private void loadTokens()
    {
        SqlCommand cmd = new SqlCommand("select  * from t_token");
        Repeater1.DataSource = general.getSet(cmd);
        Repeater1.DataBind();
    }
    private string useTokens()
    {
        SqlCommand cmd = new SqlCommand("select top 1 token from t_token where isUsed=0");
        string token = general.getSingleData(cmd);

        SqlCommand cm = new SqlCommand("update t_token set isUsed=1");
        general.performAction(cm);

        return token;
    }

    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cm = new SqlCommand("truncate table t_token");
        general.performActionNoTrans(cm);
        loadTokens();
    }
    private void createToken()
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO t_token (token,CreatedOn,isUsed) VALUES (@token,GETDATE(),0)");
        cmd.Parameters.Add("@token", SqlDbType.VarChar).Value = general.GetRandomPasswordUsingGUID(15);
        general.performAction(cmd);
        loadTokens();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        createToken();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        createToken();
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        createToken();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        createToken();
    }
}