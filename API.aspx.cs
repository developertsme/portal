using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class API : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Files["file"] != null)
        {
            saveFile();
            return;
        }
        try
        {
            String action = Request.QueryString["action"].ToString();
            int count = Request.Form.Count;
            object[] mParams = new object[0];
            if (count >= 1) mParams = new object[count - 1];
            int a = 0;
            foreach (var key in Request.Form.AllKeys)
            {
                if (key != "action")
                {
                    mParams[a] = Request.Form[key];
                    a++;
                }
            }

            adata t = new adata();
            object temp = typeof(adata).GetMethod(action).Invoke(t, mParams);
            Response.Write(temp.ToString());
        }
        catch (Exception ex)
        {
            //Response.Write("[ERROR. Contact ARESH]");
            Response.Write(ex.ToString());
        }
    }


    private void saveFile()
    {
        try
        {
            HttpPostedFile file = Request.Files["file"];
            var path = Path.Combine(Server.MapPath("~/uploads/voice"), "recording_" +
                Request.QueryString["task"].ToString() + "_" + general.GetRandomPasswordUsingGUID(5) + ".mp3");
            file.SaveAs(path);
        }
        catch (Exception) { }
    }
}
