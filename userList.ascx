<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userList.ascx.cs" Inherits="sidetab3_userList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="list-group list-group-accent">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Change/Reset Password</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
 
        <small class="text-muted"><i class="icon-user"></i>&nbsp; New Password:<br />
            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control"></asp:TextBox></small>
        <small class="text-muted"><i class="icon-user"></i>&nbsp; Retype New Password:<br />
            <asp:TextBox ID="txtnewpassword" runat="server" CssClass="form-control"></asp:TextBox></small>
    </div>

    <br />
    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info btn-lg btn-block" runat="server"  OnClientClick="loader();">Update</asp:LinkButton>
    <br />
    
    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-info btn-lg btn-block" runat="server"  OnClientClick="loader();">Send Reset Link</asp:LinkButton>
</div>