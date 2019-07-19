using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for sched
/// </summary>
public class generic
{

    public static string notify(string msg)
    {
        return "new Notification('Al Tannan Group System Notification', {icon: '/images/favicon.ico',body: "+ msg +", });";
    }
    public static string openFiles(string content)
    {
        string output = "";
        string[] files = content.Split(',');
        foreach (string f in files)
        {
            if (f.Length > 5)
            {
                string name = f.Replace(@"C:\inetpub\wwwroot\Portal\website\", "");
                output = output + "<a href='"+ name +"'> <strong>Open File </strong>" + name + "</a><br/>";
            }
        }
        return output;
    }
    public static bool isAccess(string role)
    {
        if (role == "user")
        {
            return false;
        }
        else return true;
    }
    public static string getShortName(string u)
    {
        SqlCommand cmd2 = new SqlCommand("select shortname from ats_users where username=@id");
        cmd2.Parameters.Add("@id", SqlDbType.VarChar).Value = u;
        return general.getSingleData(cmd2);
    }    
    public static string getShortNameID(string u)
    {
        SqlCommand cmd2 = new SqlCommand("select shortname from ats_users where memid=@id");
        cmd2.Parameters.Add("@id", SqlDbType.VarChar).Value = u;
        return general.getSingleData(cmd2);
    }
    public static string getMemID(string u)
    {
        SqlCommand cmd2 = new SqlCommand("select memid from ats_users where username=@id");
        cmd2.Parameters.Add("@id", SqlDbType.VarChar).Value = u;
        return general.getSingleData(cmd2);
    }
    private static string getUserBranch(string user)
    {
        SqlCommand cmd2 = new SqlCommand("select branch from ats_users where username=@id");
        cmd2.Parameters.Add("@id", SqlDbType.VarChar).Value = user;
        return general.getSingleData(cmd2);
    }
    public static string getFullDepartmentName(string code)
    {
        SqlCommand cmd = new SqlCommand("select mykey from ats_lookup where mygroup='DEPARTMENT' and myvalue=@branch order by id desc");
        cmd.Parameters.Add("@branch", SqlDbType.VarChar).Value = code;
        return general.getSingleData(cmd);
    }
    public static DataSet getDepartment(string user)
    {
        if (user == "")
        {
            string branch = getUserBranch(user);
            SqlCommand cmd = new SqlCommand("select mykey,myvalue from ats_lookup where mygroup='DEPARTMENT' and myvalue=@branch order by id desc");
            cmd.Parameters.Add("@branch", SqlDbType.VarChar).Value = branch;
            DataSet ds = general.getSet(cmd);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds;
                }
            }
        }
        else
        {
            DataSet ds = general.getSet("select mykey,myvalue from ats_lookup where mygroup='DEPARTMENT' order by id desc");
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds;
                }
            }
        }
        return null;
    }
    public static DataSet getUsers()
    {
        DataSet ds2 = general.getSet("select username,shortname from ats_Users");
        if (ds2.Tables.Count > 0)
        {
            if (ds2.Tables[0].Rows.Count > 0)
            {
                return ds2;
            }
        }
        return null;
    }
    public static DataSet getTaskUsers(string branch)
    {
        SqlCommand cmd = new SqlCommand("select username,shortname from ats_Users where role in ('admin','HR','manager') or branch=@branch order by shortname desc");
        cmd.Parameters.Add("@branch", SqlDbType.VarChar).Value = branch;
        DataSet ds2 = general.getSet(cmd);
        if (ds2.Tables.Count > 0)
        {
            if (ds2.Tables[0].Rows.Count > 0)
            {
                return ds2;
            }
        }
        return null;
    }
}
public class sched
{
    public int numEmp { get; set; }
    public int shift { get; set; }
    public int hours { get; set; }

    Dictionary<int, semp> shopEmps;

    DataTable ds;
    public sched()
    {
    }
    public sched(int _numEmp, int _shift, int _hours)
    {
        numEmp = _numEmp;
        shift = _shift;
        hours = _hours;
        ds = new DataTable();
        shopEmps = new Dictionary<int, semp>();
        assignEmp(); //Create the employees with utilization zero;

        datatable(); //create the table struct

        assignOff(); //assign Open shifture of employees and number of weeks

        assignOpening("OPENING"); //assign Open shift
        assignOpening("CLOSING"); //assign Open shift

        assignOpening("AFTERNOON"); //assign Open shift
        assignOpening("CLOSING"); //assign Open shift

        assignOpening("AFTERNOON"); //assign Open shift
        assignOpening("OPENING"); //assign Open shift

        assignOpening("CLOSING"); //assign Open shift
        assignOpening("CLOSING"); //assign Open shift
        assignOpening("OPENING"); //assign Open shift

    }
    private void assignOpening(string name)
    {
        //randomly grab a utilized zero employee and assign open shift
        Random r = new Random();
        for (int j = 1; j <= 7; j++)
        {
            int pos = getLowUtilization();
            if (ds.Rows[pos][j].ToString().Length < 1)
            { 
                shopEmps[pos].computeUtilization(hours, (hours * 7 * numEmp)); //8 hours worked for total 40 hours
                ds.Rows[pos][j] = name + ": %" + shopEmps[pos].utilization.ToString();
            }
        }
    }
    private void assignOff()
    {
        //randomly grab a utilized zero employee and assign close shift
        Random r = new Random();
        for (int j = 2; j <= 6; j++)
        {
            for(int i=0; i<numEmp; i++)
            {    
                if (ds.Rows[i][j].ToString().Length < 1)
                {
                    if (shopEmps[i].takenOff == false)
                    {
                        if (!daySomeoneIsOff(j))
                        {
                            shopEmps[i].computeUtilization(hours, (hours * 7 * numEmp)); //8 hours worked for total 40 hours
                            shopEmps[i].takenOff = true;
                            ds.Rows[i][j] = "--DAY OFF--";
                        }
                        else
                        {
                            if (numEmp > 5)
                            { 
                                if (r.Next(0, 100) < 10)
                                {
                                    shopEmps[i].computeUtilization(hours, (hours * 7 * numEmp)); //8 hours worked for total 40 hours
                                    shopEmps[i].takenOff = true;
                                    ds.Rows[i][j] = "--DAY OFF--";
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    private bool daySomeoneIsOff(int col)
    {
        foreach(DataRow dr in ds.Rows)
        {
            if (dr[col].ToString() == "--DAY OFF--")
            {
                return true;
            }
        }
        return false;
    }
    private List<int> nonworking(int day)
    {
        List<int> emptylist = new List<int>();
        int pos = 0;
        foreach (DataRow dr in ds.Rows)
        {
            if (dr[day].ToString().Length < 1 )
            {
                emptylist.Add(pos);
            }
            pos++;
        }
        return emptylist;
    }
    private int getLowUtilization()
    {
        int i = 0;
        Random r = new Random();

        int low = r.Next(0, shopEmps.Count);

        int Minutil = shopEmps[low].utilization;
        foreach (var emp in shopEmps)
        {
            int util = shopEmps[emp.Key].utilization;
            if (Minutil > util)
            {
                Minutil = shopEmps[emp.Key].utilization;
                low = emp.Key;
            }
            i++;
        }
        return low;
    }
    private void datatable()
    {
        ds.Columns.Add("Names");
        ds.Columns.Add("Saturday"); //1
        ds.Columns.Add("Sunday"); //2
        ds.Columns.Add("Monday");//3
        ds.Columns.Add("Teusday");//4
        ds.Columns.Add("Wednesday");//5
        ds.Columns.Add("Thursday");//6
        ds.Columns.Add("Friday");//7

        for(int i=0; i <numEmp; i++)
        {
            DataRow dr = ds.NewRow();
            dr["Names"] = shopEmps[i].name;
            ds.Rows.Add(dr);
        }
    }
    private void assignEmp()
    {
        for(int i=0; i<numEmp; i++)
        {
            shopEmps.Add(i, new semp("employee" + i));
        }
    }
    public DataTable getSched()
    {
        return ds;
    }
    public IEnumerable<TValue> RandomValues<TKey, TValue>(IDictionary<TKey, TValue> dict)
    {
        Random rand = new Random();
        List<TValue> values = Enumerable.ToList(dict.Values);
        int size = dict.Count;
        while (true)
        {
            yield return values[rand.Next(size)];
        }
    }
}
public class semp
{
    public int utilization { get; set; }
    public string name { get; set; }
    public bool takenOff { get; set; }
    public int hours { get; set; }
    public semp()
    {
        utilization = 0;
    }
    public semp(string _name)
    {
        utilization = 0;
        name = _name;
        takenOff = false;
        hours = 0;
    }
    public void computeUtilization(int hourswork, int totalhours)
    {
        hours += hourswork;
        utilization = utilization + Convert.ToInt32((Convert.ToDouble(hours) / totalhours * 100));
    }
}
