<%@ Control Language="C#" AutoEventWireup="true" CodeFile="profile.ascx.cs" Inherits="sidetab1_profile" %>

<div class="list-group list-group-accent"  id="myangular" ng-controller="tab1_profile">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Task Notes</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <div>
            <strong>{{datalist[0].note}}</strong>
        </div>
    </div>
    <br />
    <div style="display:none">
        <input id="lblid" type="text" runat="server" value="{{datalist[0].id}}" /></div>
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Actions</div>
    <div class="row">
        <div class="form-group col-sm-6">
            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-success" OnClientClick="loader();" runat="server" OnClick="LinkButton1_Click">Completed</asp:LinkButton>
        </div>
        <div class="form-group col-sm-6">
            <asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-danger" OnClientClick="loader();" runat="server" OnClick="LinkButton2_Click">Pending</asp:LinkButton>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-sm-6">
            <asp:LinkButton ID="LinkButton3" CssClass="btn btn-outline-warning" OnClientClick="loader();" runat="server" OnClick="LinkButton3_Click">Transfer</asp:LinkButton>
        </div>
        <div class="form-group col-sm-6">
            <asp:LinkButton ID="LinkButton4" CssClass="btn btn-outline-info" OnClientClick="loader();" runat="server" OnClick="LinkButton4_Click">Close</asp:LinkButton>
        </div>
    </div>
    

</div>

