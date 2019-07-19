<%@ Control Language="C#" AutoEventWireup="true" CodeFile="accountsList.ascx.cs" Inherits="sidetab2_accountsList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Literal ID="txtalert" runat="server"></asp:Literal>
<div class="list-group list-group-accent">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Change/Reset Password</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
 
        <small class="text-muted"><i class="icon-user"></i>&nbsp; New Password:<br />
            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></small>
        <small class="text-muted"><i class="icon-user"></i>&nbsp; Retype New Password:<br />
            <asp:TextBox ID="txtnewpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></small>
    </div>

    <br />
    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info btn-lg btn-block" runat="server"  OnClientClick="loader();" OnClick="LinkButton1_Click">Update</asp:LinkButton>
    <br />
    
    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-info btn-lg btn-block" runat="server"  OnClientClick="loader();" OnClick="LinkButton2_Click">Send Reset Link</asp:LinkButton>
</div>
<asp:Literal ID="txtscript" runat="server"></asp:Literal>