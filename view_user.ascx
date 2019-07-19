<%@ Control Language="C#" AutoEventWireup="true" CodeFile="view_user.ascx.cs" Inherits="sidetab2_view_user" %>

<div class="list-group list-group-accent"   id="myangular1" ng-controller="tab2_orderList">


     <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Order Items</div>

    
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider" ng-repeat="x in datalist">
        <div>
            <strong>{{x.product_id}}</strong>
        </div>
        <small class="text-muted"> Price:<br />
            <i class="icons cui-euro"></i>&nbsp;{{x.product_price}}</small><br />
        <small class="text-muted"> Quantity:<br />
            <i class="icons cui-pie-chart"></i>&nbsp; {{x.quantity}} pcs</small>
    </div>
</div>
