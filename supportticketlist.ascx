<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supportticketlist.ascx.cs" Inherits="sidetab1_supportticketlist" %>
<div class="list-group list-group-accent"  id="myangular" ng-controller="tab1_supportticket">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Support Ticket Notes</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider"  ng-repeat="x in datalist">
        <div>
            <strong>{{x.head}}</strong>
        </div>
        <small class="text-muted">{{x.body}}</small>
    </div>
</div>
