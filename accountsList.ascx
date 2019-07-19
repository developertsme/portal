<%@ Control Language="C#" AutoEventWireup="true" CodeFile="accountsList.ascx.cs" Inherits="sidetab1_accountsList" %>

<div class="list-group list-group-accent">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Backend Account</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <div>
            <strong>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal></strong>
        </div>
        <div>
            <strong>
            <asp:Literal ID="Literal6" runat="server"></asp:Literal></strong>
        </div>
        <hr />
        
        <small class="text-muted"> Short Name<br />
            <asp:Literal ID="Literal2" runat="server"></asp:Literal> </small>
        <br />
        <small class="text-muted"><i class="icon-user"></i>&nbsp;  Username:<br />
            
            <asp:Literal ID="Literal3" runat="server"></asp:Literal></small>
        <br />
         <small class="text-muted"> Email:<br />
            <strong>
            <asp:Literal ID="Literal4" runat="server"></asp:Literal></strong>
        </small>
        <br />
         <small class="text-muted"> Company:<br />
            <strong>
            <asp:Literal ID="Literal5" runat="server"></asp:Literal></strong>
        </small>
        <br />
        
        <small class="text-muted"> Branch:<br />
            <asp:Literal ID="Literal7" runat="server"></asp:Literal> </small>
        <br />
        <small class="text-muted"> Role:<br />
            <asp:Literal ID="Literal8" runat="server"></asp:Literal> </small>
        <br />
        <br />
    </div>

    <br />
    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger btn-lg btn-block" OnClientClick="loader();" runat="server" OnClick="LinkButton2_Click">Delete </asp:LinkButton>
    <br />
    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-success btn-lg btn-block" OnClientClick="loader();" runat="server" OnClick="LinkButton1_Click">View Details </asp:LinkButton>
</div>
