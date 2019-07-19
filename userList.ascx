<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userList.ascx.cs" Inherits="sidetab1_userList" %>
<div class="list-group list-group-accent">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Customer</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <div>
            <strong>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal></strong>
        </div>
        <div>
            <strong>
            <asp:Literal ID="Literal2" runat="server"></asp:Literal></strong>
        </div>
        <hr />
        <small class="text-muted"><i class="icon-user"></i>&nbsp;  Username:<br />
            
            <asp:Literal ID="Literal3" runat="server"></asp:Literal></small>
        <br />
         <small class="text-muted"> Email:<br />
            <strong>
            <asp:Literal ID="Literal4" runat="server"></asp:Literal></strong>
        </small>
        <br />
         <small class="text-muted"> Contact Number:<br />
            <strong>
            <asp:Literal ID="txtcontact" runat="server"></asp:Literal></strong>
        </small>
        <br />
        <small class="text-muted"> <i class="icon-location-pin"></i>&nbsp;  Billing Address:<br />
           
            <asp:Literal ID="Literal5" runat="server"></asp:Literal></small>
        <br />
        <small class="text-muted"> <i class="icon-location-pin"></i>&nbsp;  Shipping Address:<br />
            <asp:Literal ID="Literal6" runat="server"></asp:Literal> </small>
        <br />
        
        <small class="text-muted"><i class="icon-flag"></i>&nbsp;  Country:<br />
            <i class="flag-icon flag-icon-<%=flag.ToLower() %> h1 mb-0" id="<%=flag %>" title="<%=flag %>"></i> </small>
        <br />
    </div>

    <br />
    <a href="website.aspx?page=new_user" class="btn btn-info btn-lg btn-block"> New Account </a>
    <br />
    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-success btn-lg btn-block" OnClientClick="loader();" runat="server" OnClick="LinkButton1_Click">View Details </asp:LinkButton>
</div>
