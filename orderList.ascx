<%@ Control Language="C#" AutoEventWireup="true" CodeFile="orderList.ascx.cs" Inherits="sidetab3_orderList" %>
<div class="list-group list-group-accent"  id="myangular2" ng-controller="tab3_orderList">


     <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Payments</div>
    <div class="list-group-item  list-group-item-divider">
        <span class="text-muted"> Total No. Payments:<br />
             {{ datalist.length }} &nbsp;</span>
    </div>
    <div class="list-group-item  list-group-item-divider">
        <span class="text-muted"> Total Amount:<br />
             {{ getTotal() }} &nbsp;<i class="icons cui-euro"></i></span>
    </div>
    <br /><br />
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider"  ng-repeat="x in datalist">
        <div>
            <small>{{x.saferpay_transaction_id}}</small>
        </div>
        <span class="text-muted"> Price:<br />
           <strong> <i class="icons cui-euro"></i>&nbsp; {{x.value}} </strong></span><br />
        <span class="text-muted"> Payment State:<br />
            <strong><i class="icons cui-pie-chart"></i>&nbsp; {{x.name}}</strong></span>
    </div>
    
    
</div>
