<%@ Control Language="C#" AutoEventWireup="true" CodeFile="view_user.ascx.cs" Inherits="sidetab1_view_user" %>
<div class="list-group list-group-accent"  id="myangular" ng-controller="tab1_viewUser">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Order Details</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <div>
            <strong>{{datalist[0].uid}}</strong>
        </div>
        <small class="text-muted"> Note:<br />
            <i class="icon-location-pin"></i>&nbsp; {{datalist[0].note}}</small>
        <br />
        <small class="text-muted"> Shipping Note:<br />
            <i class="icon-location-pin"></i>&nbsp;  {{datalist[0].note_shipping}} </small>
    </div>
</div>
