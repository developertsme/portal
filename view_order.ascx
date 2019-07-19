<%@ Control Language="C#" AutoEventWireup="true" CodeFile="view_order.ascx.cs" Inherits="sidetab1_view_order" %>

<div class="list-group list-group-accent"  id="myangular" ng-controller="tab1_orderList">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Customer</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <div>
            <strong>{{datalist[0].name}} {{datalist[0].surname}}</strong>
        </div>
        <small class="text-muted"> Billing Address:<br />
            <i class="icon-location-pin"></i>&nbsp; {{datalist[0].billing_address}}</small>
        <br />
        <small class="text-muted"> Shipping Address:<br />
            <i class="icon-location-pin"></i>&nbsp;  {{datalist[0].shipping_address}} </small>
        <br />
         <small class="text-muted"> Email:<br />
            <strong> {{datalist[0].email}}</strong>
        </small>
    </div>
    <a href="website.aspx?page=view_user&id={{datalist[0].uid}}" class="btn btn-info btn-lg btn-block"> Customer Details</a>
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Order Address</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <small class="text-muted"> Billing Address:<br />
            <strong><i class="icon-location-pin"></i>&nbsp; {{orderlist[0].address_billing_id}}</strong></small>
        <br />
        <small class="text-muted"> Shipping Address:<br />
            <strong><i class="icon-location-pin"></i>&nbsp;  {{orderlist[0].address_shipping_id}}</strong></small>
        <br />
         <small class="text-muted"> Shipping Note:<br />
            <strong> {{orderlist[0].note_shipping}}</strong>
        </small>
    </div>
    <br />
    <a href="website.aspx?page=new_order" class="btn btn-info btn-lg btn-block"> New Order </a>
</div>