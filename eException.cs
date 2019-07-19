using System;
using System.Collections.Generic;
using System.Web;
using System.Runtime.Serialization;
using System.IO;

/// <summary>
/// Summary description for eException
/// </summary>
[Serializable]
public class eException : System.Exception
{
    private string m_exceptionString;
    public eException()
        : base()
    {
        m_exceptionString = null;
    }
    public eException(string exceptionString)
        : base()
    {
        try
        {
            string filename = HttpContext.Current.Server.MapPath("~/Log/log.txt");
            File.AppendAllText(filename, Environment.NewLine + exceptionString + "URL: " + HttpContext.Current.Request.Url.ToString() +" Error : " + DateTime.Now.AddHours(13).ToString());

        }
        catch (Exception)
        {
            /*string filename = HttpContext.Current.Server.MapPath("~/Log/") + "log.txt";
            StreamWriter w;
            w = File.CreateText(filename);
            w.WriteLine("Text File Created on: " + DateTime.Now);
            w.WriteLine("____________________________________________________________________________________");
            w.Flush();
            w.Close();*/
        }
    }
    public eException(string exceptionString, Exception ex)
        : base(exceptionString, ex)
    {
        m_exceptionString = exceptionString;
    }
    public override string ToString()
    {
        return m_exceptionString;
    }
}