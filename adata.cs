using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class adata
{
    #region orders

    public static string get_order(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_order_items tbl where order_id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string get_order_details(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from view_order_address where uid=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }


    public static string get_orderItems(string id)
    {
        SqlCommand cmd = new SqlCommand("select *,(select top 1 name from view_product where id=tbl.product_variation_id) as product_id from t_order_items tbl where order_id=(select top 1 id from t_orders where uid=@id)");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string get_order_payment(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from view_payments where order_id=(select top 1 id from t_orders where uid=@id)");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }

    public static string get_customer_details_by_order(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_users where id =(select top 1 account_id from t_orders where uid=@id)");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string get_customer_order(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_orders where account_id = (select id from t_users where uid=@id)");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string get_customer_payment(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from view_payments where order_id in (select id from t_orders where account_id = (select id from t_users where uid=@id))");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string get_customer_tickets(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_support_tickets where account_id=(select id from t_users where uid=@id)");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    #endregion
    #region other
    public static DataSet get_allCountries()
    {
        SqlCommand cmd = new SqlCommand("select name + ' ' + iso_code as name, iso_code as id from t_countries order by iso_code");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return ds;
        }
        return null;
    }
    public static String get_aCountries()
    {
        SqlCommand cmd = new SqlCommand("select name + ' ' + iso_code as name, iso_code as id from t_countries order by iso_code");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string get_email_template(string name)
    {
        SqlCommand cmd = new SqlCommand("select template from ats_mailTemplate where [key]=@key");
        cmd.Parameters.Add("@key", SqlDbType.VarChar).Value = name;
        return general.getSingleData(cmd);
    }
    public static string get_backend_accounts(string none)
    {
        SqlCommand cmd = new SqlCommand("select fullname,id from ats_users");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    #endregion
    #region customer
    public static DataRow get_acustomer(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from view_users where uid=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            return dr;
        }
        return null;
    }
    public static DataRow get_ascustomer(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_users where uid=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            return dr;
        }
        return null;
    }
    public static DataSet get_allCustomers()
    {
        SqlCommand cmd = new SqlCommand("select name + ' ' + surname as name, id, email, username from t_users order by name");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return ds;
        }
        return null;
    }
    public static string get_customer(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_users where uid=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string get_searchcustomer(string term)
    {
        SqlCommand cmd = new SqlCommand("select top 10 * from t_users where email like '%'+@id+'%' or name like @id+'%'");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = term;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    #endregion
    #region products
    public static string get_products()
    {
        SqlCommand cmd = new SqlCommand("select * from t_products");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string search_product(string id)
    {
        SqlCommand cmd = new SqlCommand("select top 10 uid,id,name,price from view_product where name like '%'+@id+'%'");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string search_product_variations(string id)
    {
        SqlCommand cmd = new SqlCommand("select id,name from t_product_variations where product_id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string get_searchproduct(string term)
    {
        SqlCommand cmd = new SqlCommand("select top 10 * from view_product where name like '%'+@id+'%'");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = term;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string add_product_order(string orderid, string productid, string price, string qty, string total)
    {
        SqlCommand cmd = new SqlCommand("insert into t_order_items " +
            "(order_id,product_variation_id,product_price,quantity,total_products) " +
            "VALUES (@order_id,@product_variation_id,@product_price,@quantity,@total_products)");
        cmd.Parameters.Add("@order_id", SqlDbType.VarChar).Value = orderid;
        cmd.Parameters.Add("@product_variation_id", SqlDbType.VarChar).Value = productid;
        cmd.Parameters.Add("@product_price", SqlDbType.VarChar).Value = price;
        cmd.Parameters.Add("@quantity", SqlDbType.VarChar).Value = qty;
        cmd.Parameters.Add("@total_products", SqlDbType.VarChar).Value = total;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    #endregion
    #region ticket
    public static string get_ticket_rev(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_support_tickets_activity where userid = @id order by id desc");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string get_ticket_emails(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from view_ticket_emails where support_ticket_id=(select id from t_support_tickets where uid=@id ) order by id desc");
        //SqlCommand cmd = new SqlCommand("select id,created_at, message,CASE WHEN is_customer_message=1 THEN 'CUSTOMER' ELSE 'AGENT' END as is_customer_message_name from t_support_ticket_messages where support_ticket_id=(select id from t_support_tickets where uid=@id ) order by id desc");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string getCategory(string id)
    {
        SqlCommand cmd = new SqlCommand("select name from t_support_ticket_categories where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        return general.getSingleData(cmd);
    }
    public static string get_ticket_category_list(string none)
    {
        SqlCommand cmd = new SqlCommand("select id,name from t_support_ticket_categories order by name");
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        else { return "[]"; }
    }
    public static string add_ticket_update(string parentid, string userid, string head, string body)
    {
        SqlCommand cmd = new SqlCommand("insert into t_support_tickets_activity (parentid,userid,head,body,CreatedOn) " +
            "VALUES (@parentid,@userid,@head,@body,GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = parentid;
        cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = userid;
        cmd.Parameters.Add("@head", SqlDbType.VarChar).Value = head;
        cmd.Parameters.Add("@body", SqlDbType.VarChar).Value = body;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    public static string email_ticket_update(string id, string to, string cc, string subject, string body)
    {
        SqlCommand cmd = new SqlCommand("insert into t_support_ticket_messages (support_ticket_id,emailto,emailcc,emailsubject,message,is_customer_message,CreatedOn) " +
            "VALUES (@parentid,@emailto,@emailcc,@emailsubject,@message,'0',GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = id;
        cmd.Parameters.Add("@emailto", SqlDbType.VarChar).Value = to;
        cmd.Parameters.Add("@emailcc", SqlDbType.VarChar).Value = cc;
        cmd.Parameters.Add("@emailsubject", SqlDbType.VarChar).Value = subject;
        cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = body;
        general.performAction(cmd);

        //send email
        general.sendMail(to, subject, body, "");
        return general.TextToJson("Email Sent");
    }
    public static string email_ticket_update_customer(string id, string body)
    {
        SqlCommand cmd = new SqlCommand("insert into t_support_ticket_messages (support_ticket_id,emailto,emailcc,emailsubject,message,is_customer_message,created_at) " +
            "VALUES (@parentid,@emailto,@emailcc,@emailsubject,@message,'1',GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = id;
        cmd.Parameters.Add("@emailto", SqlDbType.VarChar).Value = "";
        cmd.Parameters.Add("@emailcc", SqlDbType.VarChar).Value = "";
        cmd.Parameters.Add("@emailsubject", SqlDbType.VarChar).Value = "";
        cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = body;
        general.performAction(cmd);

        return general.TextToJson("Confirmed Email");
    }
    public static string get_ticket_activity_list(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_support_tickets_activity where parentid=@id order by id desc");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string add_ticket(string categoryid, string userid, string title, string accountmanager, string assignto, string orderid, string orderitem, string note, string tags)
    {
        SqlCommand cmd = new SqlCommand("insert into t_support_tickets (support_ticket_category_id,account_id,title) " +
            "VALUES (@support_ticket_category_id,@account_id,@title)");
        cmd.Parameters.Add("@support_ticket_category_id", SqlDbType.VarChar).Value = categoryid;
        cmd.Parameters.Add("@account_id", SqlDbType.VarChar).Value = userid;
        cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;

        cmd.Parameters.Add("@accountmanager", SqlDbType.VarChar).Value = accountmanager;
        cmd.Parameters.Add("@assignto", SqlDbType.VarChar).Value = assignto;
        cmd.Parameters.Add("@orderid", SqlDbType.VarChar).Value = orderid;
        cmd.Parameters.Add("@orderitem", SqlDbType.VarChar).Value = orderitem;
        cmd.Parameters.Add("@note", SqlDbType.VarChar).Value = note;
        cmd.Parameters.Add("@tags", SqlDbType.VarChar).Value = tags;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    #endregion

    #region Account
    public static DataRow get_asaccount(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from ats_users where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            DataRow dr = ds.Tables[0].Rows[0];
            return dr;
        }
        return null;
    }
    public static string get_contact_activity_list(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_contacts_activity where parentid=@id order by id desc");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string add_contact_activity(string parentid, string head, string body)
    {
        SqlCommand cmd = new SqlCommand("insert into t_contacts_activity (parentid,head,body,CreatedOn) " +
            "VALUES (@parentid,@head,@body,GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = parentid;
        cmd.Parameters.Add("@head", SqlDbType.VarChar).Value = head;
        cmd.Parameters.Add("@body", SqlDbType.VarChar).Value = body;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    public static string email_contact_update(string id, string to, string cc, string subject, string body)
    {
        general.sendMail(to, "Contact- " + subject, body, "");
        return general.TextToJson("Email Sent");
    }
    #endregion

    #region Task
    public static string add_task(string subject, string note, string deadline, string reminder, string assignto, string createdby)
    {
        SqlCommand cmd = new SqlCommand("insert into t_tasks (deadline,subject,note,reminder,assignTo,CreatedOn,CreatedBy,status) " +
            "VALUES (@deadline,@subject,@note,@reminder,@assignTo,GETDATE(),@CreatedBy,'NEW')");
        cmd.Parameters.Add("@subject", SqlDbType.VarChar).Value = subject;
        cmd.Parameters.Add("@note", SqlDbType.VarChar).Value = note;
        cmd.Parameters.Add("@deadline", SqlDbType.VarChar).Value = deadline;
        cmd.Parameters.Add("@reminder", SqlDbType.VarChar).Value = reminder;
        cmd.Parameters.Add("@assignto", SqlDbType.VarChar).Value = assignto.Length > 1 ? assignto : createdby;
        cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = createdby;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    public static string get_task(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_tasks where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }

    #endregion

    #region Shop
    public static string get_shop_branch(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_shops_branch where parentid=@id order by id desc");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string get_shop_customer(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from t_users where uid in (select customer from t_shops_customer where parentid=@id)");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
        DataSet ds = general.getSet(cmd);
        if (general.checkEmptyDS(ds))
        {
            return general.DStoJSON(ds);
        }
        return "[]";
    }
    public static string add_shop_customer(string customer, string parentid)
    {
        SqlCommand cmd = new SqlCommand("insert into t_shops_customer (parentid,customer,CreatedOn) " +
            "VALUES (@parentid,@customer,GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = parentid;
        cmd.Parameters.Add("@customer", SqlDbType.VarChar).Value = customer;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    public static string add_shop_branch(string address,string name, string number, string parentid)
    {
        SqlCommand cmd = new SqlCommand("insert into t_shops_branch (parentid,address,name,number,CreatedOn) " +
            "VALUES (@parentid,@address,@name,@number,GETDATE())");
        cmd.Parameters.Add("@parentid", SqlDbType.VarChar).Value = parentid;
        cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = address;
        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
        cmd.Parameters.Add("@number", SqlDbType.VarChar).Value = number;
        bool saved = general.performAction(cmd);
        return general.TextToJson(saved.ToString());
    }
    #endregion
}