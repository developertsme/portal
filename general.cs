using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web.UI;
using System.IO;

/// <summary>
/// Summary description for general
/// </summary>
public class general
{
    public static bool checkEmptyDS(DataSet ds)
    {
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
        }
        return false;
    }
    public static string myalert(string msg)
    {
        string content = "<br/><div class=\"alert alert-success\" role=\"alert\">" +
                            "<strong>" + msg + "</strong>" +
                          "</div>";
        return content;
    }
    public static string myerror(string msg)
    {
        string content = "<br/><div class=\"alert alert-danger\" role=\"alert\">" +
                            "<strong>" + msg + "</strong>" +
                          "</div>";
        return content;
    }
    public static DataSet TransformDt(DataTable input)
    {
        DataSet ds = new DataSet();
        DataTable output = new DataTable("Output");
        for (int i = 0; i < input.Rows.Count; i++)
        {
            output.Columns.Add(input.Rows[i][0].ToString());//"Data "+(i+1).ToString());
        }
        for (int rows = 1; rows < input.Columns.Count; rows++)
        {
            DataRow temp = output.NewRow();
            temp[0] = input.Columns[rows].ColumnName.ToString();
            for (int cols = 0; cols < input.Rows.Count; cols++)
            {
                string val = input.Rows[cols][rows].ToString();
                temp[cols] = val;
            }
            output.Rows.Add(temp);
        }
        ds.Tables.Add(output);
        return ds;
    }
    public static string myLabel(string str)
    {
        if (str.Length > 0)
        {
            return str.Substring(0, 1).ToUpper() + str.Substring(1, str.Length - 1).ToLower();
        }
        else return str;
    }
    /// <summary>
    /// shows an alert window using teleriks RadAjaxManager
    /// </summary>
    /// <param name="msg"></param>
    public static void alert(string msg)
    {
        try
        {
            //System.Web.UI.Page page = HttpContext.Current.Handler as System.Web.UI.Page;
            //RadAjaxManager.GetCurrent(page).Alert(msg);
            int? temp = Convert.ToInt32("A1");
        }
        catch (Exception)
        {
            StringBuilder mySB = new StringBuilder("");

            mySB.Append("<script language=javascript>");
            mySB.Append("alert(\"");
            mySB.Append(msg);
            mySB.Append("\");</script>");

            HttpContext.Current.Response.Write(mySB.ToString());
        }
    }

    /// <summary>
    /// returns a dataset given an Sql Command
    /// </summary>
    /// <param name="cmd">SqlCommand</param>
    /// <returns>Dataset</returns>
    public static DataSet getSet(SqlCommand cmd)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = SqlConn())
        {
            try
            {
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "newset");
                return ds;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return ds;
            }
        }
    }

    /// <summary>
    /// Returns a dataset given an sql statement and a database
    /// </summary>
    /// <param name="sql">Sql Statement</param>
    /// <param name="client">Database</param>
    /// <returns>DataSet</returns>
    public static DataSet getSet(string sql, string client)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = SqlConn(client))
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "newset");
                return ds;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return ds;
            }
        }
    }

    /// <summary>
    /// returns a dataset given an Sql statement
    /// </summary>
    /// <param name="sql">Sql Statement</param>
    /// <returns></returns>
    public static DataSet getSet(string sql)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = SqlConn())
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "newset");
                return ds;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return ds;
            }
        }
    }

    /// <summary>
    /// returns a dataset given an sql command and a database
    /// </summary>
    /// <param name="cmd">SqlCommand</param>
    /// <param name="client">client</param>
    /// <returns>Dataset</returns>
    public static DataSet getSet(SqlCommand cmd, string client)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = SqlConn(client))
        {
            try
            {
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "newset");
                return ds;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return ds;
            }
        }
    }

    /// <summary>
    /// Returns a boolean on an UPDATE/DELETE sql command using a Transaction
    /// Performs Single Row Update/Delete
    /// </summary>
    /// <param name="cmd">Sql Command</param>
    /// <returns>Yes/No</returns>
    public static bool performAction(SqlCommand cmd)
    {
        using (SqlConnection con = SqlConn())
        {
            using (SqlTransaction transaction = con.BeginTransaction())
            {
                try
                {
                    cmd.Connection = con;
                    cmd.Transaction = transaction;
                    int rowCount = cmd.ExecuteNonQuery();
                    if (rowCount == 1)
                    {
                        transaction.Commit();
                        return true;
                    }
                    else
                    {
                        transaction.Rollback();
                        System.Diagnostics.Debug.WriteLine("Affected Rows: " + rowCount);
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                    new eException(ex.Message.ToString());
                    return false;
                }
            }
        }
        return false;
    }


    /// <summary>
    /// Performs an action UPDATE/DELETE given an sql command withOUT a transaction
    /// </summary>
    /// <param name="cmdd">Sql Command</param>
    /// <returns>Yes/No</returns>
    public static bool performActionNoTrans(SqlCommand cmdd)
    {
        using (SqlConnection con = SqlConn())
        {
            try
            {
                cmdd.Connection = con;
                int rowCount = cmdd.ExecuteNonQuery();
                if (rowCount == 1)
                    return true;
                else return false;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return false;
            }
        }
    }



    /// <summary>
    /// Returns a boolean on an UPDATE/DELETE sql command using a transaction
    /// Performs Single Row Update/Delete
    /// </summary>
    /// <param name="cmd">Sql Command</param>
    /// <param name="client">Database</param>
    /// <returns>Yes/No</returns>
    public static bool performActionClient(SqlCommand cmd, string client)
    {
        using (SqlConnection con = SqlConn(client))
        {
            using (SqlTransaction transaction = con.BeginTransaction())
            {
                try
                {
                    cmd.Connection = con;
                    cmd.Transaction = transaction;
                    int rowCount = cmd.ExecuteNonQuery();
                    if (rowCount == 1)
                    {
                        transaction.Commit();
                        return true;
                    }
                    else
                    {
                        transaction.Rollback();
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                    new eException(ex.Message.ToString());
                    return false;
                }
            }
        }
    }

    /// <summary>
    /// Performs an action UPDATE/DELETE given an sql command withOUT a transaction
    /// </summary>
    /// <param name="cmdd">Sql Command</param>
    /// <param name="client">Client</param>
    /// <returns>Yes/No</returns>
    public static bool performActionNoTransClient(SqlCommand cmdd, string client)
    {
        using (SqlConnection con = SqlConn(client))
        {
            try
            {
                cmdd.Connection = con;
                int actiondone = cmdd.ExecuteNonQuery();
                if (actiondone != 0)
                    return true;
                else return false;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return false;
            }
        }
    }

    /// <summary>
    /// returns a string of data given an sql command
    /// </summary>
    /// <param name="cmd">sqlCommand</param>
    /// <returns>String data</returns>
    public static string getSingleData(SqlCommand cmd)
    {
        using (SqlConnection con = SqlConn())
        {
            try
            {
                cmd.Connection = con;
                Object mydata = cmd.ExecuteScalar();
                if (mydata != null)
                {
                    return mydata.ToString();
                }
                else
                    return "";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                // new eException(ex.Message.ToString());
                return "";
            }
        }
    }
    public static string getSingleData(SqlCommand cmd, string client)
    {
        using (SqlConnection con = SqlConn(client))
        {
            try
            {
                cmd.Connection = con;
                Object mydata = cmd.ExecuteScalar();
                if (mydata != null)
                {
                    return mydata.ToString();
                }
                else
                    return "";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return "";
            }
        }
    }
    public static string getSingleData(String sql)
    {
        using (SqlConnection con = SqlConn())
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql);
                cmd.Connection = con;
                Object mydata = cmd.ExecuteScalar();
                if (mydata != null)
                {
                    return mydata.ToString();
                }
                else
                    return "";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return "";
            }
        }
    }

    /// <summary>
    /// returns an Identity Value given an sql statement and a client database
    /// Adds the Scope_Identity to the statement Automatically
    /// </summary>
    /// <param name="sql">Sql Statement</param>
    /// <param name="client">Client</param>
    /// <returns></returns>
    public static string getIdentity(string sql, string client)
    {
        sql = sql + "; Select Scope_Identity()";
        using (SqlConnection con = SqlConn(client))
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                Object identitydb = cmd.ExecuteScalar();
                if (identitydb == null)
                    return "0";
                else return identitydb.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return "0";
            }
        }
    }

    /// <summary>
    /// returns an identity value given an sqlcommand and client
    /// </summary>
    /// <param name="cmd">SqlCommand Stored Procedure or Sql Statement included</param>
    /// <param name="client">Client DB</param>
    /// <returns>String representing Identity Value</returns>
    public static string getIdentity(SqlCommand cmd, string client)
    {
        using (SqlConnection con = SqlConn(client))
        {
            try
            {
                cmd.Connection = con;
                Object identitydb = cmd.ExecuteScalar();
                if (identitydb == null)
                    return "0";
                else return identitydb.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return "0";
            }
        }
    }

    /// <summary>
    /// returns an Identity Value given an sql statement
    /// Adds the Scope_Identity to the statement Automatically
    /// </summary>
    /// <param name="sql">Sql Statement</param>
    /// <returns></returns>
    public static string getIdentity(string sql)
    {
        sql = sql + "; Select Scope_Identity()";
        using (SqlConnection con = SqlConn())
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                Object identitydb = cmd.ExecuteScalar();
                if (identitydb == null)
                    return "0";
                else return identitydb.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return "0";
            }
        }
    }

    /// <summary>
    /// returns an identity value given an sqlcommand
    /// </summary>
    /// <param name="cmd">SqlCommand Stored Procedure or Sql Statement included</param>
    /// <param name="client">Client DB</param>
    /// <returns>String representing Identity Value</returns>
    public static string getIdentity(SqlCommand cmd)
    {
        using (SqlConnection con = SqlConn())
        {
            try
            {
                cmd.Connection = con;
                Object identitydb = cmd.ExecuteScalar();
                if (identitydb == null)
                    return "0";
                else return identitydb.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
                new eException(ex.Message.ToString());
                return "0";
            }
        }
    }

    /// <summary>
    /// MD5 Hash PHP like encryptor
    /// </summary>
    /// <param name="input"></param>
    /// <returns>string with the MD5 Hash</returns>
    public static string getMd5Hash(string input)
    {
        MD5 md5Hasher = MD5.Create();
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }
        return sBuilder.ToString();
    }

    /// <summary>
    /// CDS Get status for UI
    /// </summary>
    /// <param name="UI"></param>
    /// <returns></returns>
    public static String getStatus(string UI)
    {
        using (SqlConnection con = SqlConn())
        {
            SqlCommand cmd = new SqlCommand(@"SELECT refname FROM t_ref WHERE UI=@UI", con);
            cmd.Parameters.Add("@UI", SqlDbType.VarChar).Value = UI;
            return getSingleData(cmd);
        }
    }
    /// <summary>
    /// get user session variable
    /// </summary>
    /// <returns></returns>
    public static string getUser()
    {
        if (HttpContext.Current.Session["User"] != null)
            return HttpContext.Current.Session["User"].ToString();
        else
            HttpContext.Current.Response.Redirect("~/login.aspx");
        return "System";
    }
    /// <summary>
    /// get Userlocation variable from the session
    /// </summary>
    /// <returns></returns>
    public static string getUserLocation()
    {
        if (HttpContext.Current.Session["UserLocation"] != null)
            return HttpContext.Current.Session["UserLocation"].ToString();
        else
            HttpContext.Current.Response.Redirect("~/login.aspx");
        return "System";
    }

    /// <summary>
    /// Opens an Sql Connection given the connection string in the web.config under "AppConnection"
    /// </summary>
    /// <returns>Open Connection</returns>
    public static SqlConnection SqlConn()
    {
        ConnectionStringSettingsCollection connections =
        ConfigurationManager.ConnectionStrings;

        string SqlConn = connections["AppConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(SqlConn);
        try
        {
            con.Open();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
            new eException(ex.Message.ToString());
        }
        return con;
    }
    /// <summary>
    /// Returns an open connection given the AppSetting value of "App_Clients"
    /// </summary>
    /// <param name="Client">Database</param>
    /// <returns>Open Connection</returns>
    public static SqlConnection SqlConn(String Client)
    {
        String AppSettingCon = ConfigurationManager.AppSettings.Get("App_Clients");
        string SqlConn = String.Format(AppSettingCon, Client);
        SqlConnection con = new SqlConnection(SqlConn);
        try
        {
            con.Open();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
            new eException(ex.Message.ToString());
        }
        return con;
    }

    /// <summary>
    /// constructs an sqlcommand given any number of parameters
    /// number of parameters should be EVEN
    /// first parameter is always the sqlcommand parameter ex. @id
    /// second parameter is the value ex. 5
    /// </summary>
    /// <param name="parameters">any param</param>
    /// <returns>SqlCommand</returns>
    public static SqlCommand constructSqlCommand(params object[] parameters)
    {
        SqlCommand cmd = new SqlCommand();
        int mylen = parameters.Length;
        if (mylen % 2 != 0)
        {
            new eException("Number of arguments should be even");
        }
        int i = 0;
        SqlParameter pm = null;
        foreach (object param in parameters)
        {
            i = i + 1;
            if (i % 2 == 0)
            {
                if (param.GetType().FullName == typeof(Int32).FullName)
                {
                    pm.Value = Convert.ToInt32(param);
                }
                else if (param.GetType().FullName == typeof(DateTime).FullName)
                {
                    pm.Value = Convert.ToDateTime(param);
                }
                else
                {
                    pm.Value = param.ToString();
                }
            }
            if (i % 2 == 1)
            {
                if (parameters[i].GetType().FullName == typeof(Int32).FullName)
                {
                    pm = cmd.Parameters.Add(param.ToString(), SqlDbType.Int);
                }
                else if (parameters[i].GetType().FullName == typeof(DateTime).FullName)
                {
                    pm = cmd.Parameters.Add(param.ToString(), SqlDbType.DateTime);
                }
                else
                {
                    pm = cmd.Parameters.Add(param.ToString(), SqlDbType.VarChar);
                }
            }
        }
        return cmd;
    }

    public static bool checkModuleAccess(String pageModule, String role)
    {
        SqlCommand cmd = new SqlCommand("SELECT ID FROM t_roleAccessPage WHERE roleid_fk=@id_fk AND pageModule=@page AND approved=1");
        cmd.Parameters.Add("@id_fk", SqlDbType.VarChar).Value = role;
        cmd.Parameters.Add("@page", SqlDbType.VarChar).Value = pageModule;
        string id = general.getSingleData(cmd);
        if (id != "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static bool createClientDB(String clientname)
    {
        ///this is susceptable to SQL-injection attacks
        String sql = "CREATE DATABASE [" + clientname + "]";
        return general.performActionNoTrans(new SqlCommand(sql));
    }

    /// <summary>
    /// Sends an email using System NET mail
    /// </summary>
    /// <param name="emailTo">list of emails separated by Comma (,)</param>
    /// <param name="Subject">Subject of the email</param>
    /// <param name="Body">email body</param>
    /// <returns>true/false on success/failure</returns>
    public static bool sendMail(String emailTo, String Subject, String Body, string titleemail)
    {
        //if (Convert.ToBoolean(ConfigurationManager.AppSettings.Get("emailActive")))
        //{
        try
        {
            SmtpClient client = new SmtpClient("ex2.mail.ovh.net");
            client.Credentials = new NetworkCredential("developer@tsume-art.com", "TSU*azerm7e");
            client.Port = 587;
            client.EnableSsl = true;
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("developer@tsume-art.com");
            mailMessage.To.Add(emailTo);
            mailMessage.Body = Body;
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Bcc.Add(new MailAddress("saharkiz@yahoo.com"));
            client.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
            new eException("Email Sending error: " + ex.Message.ToString());
            return false;
        }
        //}
        //else return false;

    }

    public static string GetRandomPasswordUsingGUID(int length)
    {
        // Get the GUID
        string guidResult = System.Guid.NewGuid().ToString();

        // Remove the hyphens
        guidResult = guidResult.Replace("-", string.Empty);

        // Make sure length is valid
        if (length <= 0 || length > guidResult.Length)
            new ArgumentException("Length must be between 1 and " + guidResult.Length);

        // Return the first length bytes
        return guidResult.Substring(0, length);
    }


    #region Encryption and Decryption of Self Data using SHA1024
    public static string EncryptIt(string inputString)
    {
        MemoryStream memStream = null;
        try
        {
            byte[] key = { };
            byte[] IV = { 12, 21, 43, 17, 57, 35, 67, 27 };
            string encryptKey = "aXb2uy4z";
            key = Encoding.UTF8.GetBytes(encryptKey);
            byte[] byteInput = Encoding.UTF8.GetBytes(inputString);
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            memStream = new MemoryStream();
            ICryptoTransform transform = provider.CreateEncryptor(key, IV);
            CryptoStream cryptoStream = new CryptoStream(memStream, transform, CryptoStreamMode.Write);
            cryptoStream.Write(byteInput, 0, byteInput.Length);
            cryptoStream.FlushFinalBlock();

        }
        catch (Exception ex)
        {
            return "";
        }
        return Convert.ToBase64String(memStream.ToArray());
    }
    public static string DecryptIt(string inputString)
    {
        MemoryStream memStream = null;
        try
        {
            byte[] key = { };
            byte[] IV = { 12, 21, 43, 17, 57, 35, 67, 27 };
            string encryptKey = "aXb2uy4z";
            key = Encoding.UTF8.GetBytes(encryptKey);
            byte[] byteInput = new byte[inputString.Length];
            byteInput = Convert.FromBase64String(inputString);
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            memStream = new MemoryStream();
            ICryptoTransform transform = provider.CreateDecryptor(key, IV);
            CryptoStream cryptoStream = new CryptoStream(memStream, transform, CryptoStreamMode.Write);
            cryptoStream.Write(byteInput, 0, byteInput.Length);
            cryptoStream.FlushFinalBlock();
        }
        catch (Exception ex)
        {
            return "";
        }

        Encoding encoding1 = Encoding.UTF8;
        return encoding1.GetString(memStream.ToArray());
    }
    #endregion

    public static string DStoJSON(DataSet ds)
    {
        StringBuilder json = new StringBuilder("[\n");
        if (ds.Tables.Count >= 1)
        {
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                json.Append("{");

                int i = 0;
                int colcount = dr.Table.Columns.Count;

                foreach (DataColumn dc in dr.Table.Columns)
                {
                    json.Append("\"");
                    json.Append(dc.ColumnName);
                    json.Append("\":\"");

                    char rawtab = (char)9;
                    string content = dr[dc].ToString().Replace(rawtab.ToString(), "");

                    json.Append(content);
                    json.Append("\"");

                    i++;
                    if (i < colcount) json.Append(",");

                }
                json.Append("}");
                json.Append(",");
            }
            json = json.Remove(json.Length - 1, 1);
            json.Append("\n]");
            return json.ToString();
        }
        else
        {
            return "[]";
        }

    }
    public static string TextToJson(string str)
    {
        StringBuilder json = new StringBuilder("[\n");
        json.Append("{\"Data\": \"" + str + "\"}");
        json.Append("\n]");
        return json.ToString();

    }
    public static string RelativeDate(DateTime theDate)
    {
        Dictionary<long, string> thresholds = new Dictionary<long, string>();
        int minute = 60;
        int hour = 60 * minute;
        int day = 24 * hour;
        thresholds.Add(60, "{0} seconds ago");
        thresholds.Add(minute * 2, "a minute ago");
        thresholds.Add(45 * minute, "{0} minutes ago");
        thresholds.Add(120 * minute, "an hour ago");
        thresholds.Add(day, "{0} hours ago");
        thresholds.Add(day * 2, "yesterday");
        thresholds.Add(day * 30, "{0} days ago");
        thresholds.Add(day * 365, "{0} days ago");
        thresholds.Add(long.MaxValue, "{0} years ago");

        long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;
        foreach (long threshold in thresholds.Keys)
        {
            if (since < threshold)
            {
                TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));
                return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());
            }
        }
        return "";
    }


    public static void SqlBulkCopy(string table, DataSet ds)
    {
        ConnectionStringSettingsCollection connections =
        ConfigurationManager.ConnectionStrings;

        string SqlConn = connections["AppConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(SqlConn))
        {
            using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
            {
                //Set the database table name.
                sqlBulkCopy.DestinationTableName = table;
                con.Open();
                sqlBulkCopy.WriteToServer(ds.Tables[0]);
                con.Close();
            }
        }
    }
}