<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_ticket.ascx.cs" Inherits="components_new_ticket" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:HiddenField ID="txtaccount_id" runat="server" />
<div class="row" ng-controller="main_ticket">
<div class="col-md-8 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                <i class="icon-calculator"></i>&nbsp;Customer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#home2" role="tab" aria-controls="home2">
                <i class="icon-basket-loaded"></i>&nbsp;New Ticket</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#home3" role="tab" aria-controls="home3">
                <i class="icon-pie-chart"></i>&nbsp;Ticket List
                <span class="badge badge-pill badge-danger" id="txtorderlist">{{dataticket.length}}</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#home4" role="tab" aria-controls="home4">
                <i class="icon-pie-chart"></i>&nbsp;Internal Updates</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="home1" role="tabpanel">
            <div class="card-body">
            <div class="row">
                <div class="col-sm-3">
                    <i class="flag-icon flag-icon-<%= flag.ToLower() %> h1 mb-0" id="<%= flag %>" title="<%= flag %>"></i>
                </div>
                <div class="form-group col-sm-4">
                    <label>Name</label>
                    <p class="h4 form-control-static">
                        <asp:Literal ID="txtname" runat="server" Text="First Name"></asp:Literal>
                    </p>
                </div>
                <div class="form-group col-sm-3">
                    <label>Surname:</label>
                    <p class="h4 form-control-static">
                        <asp:Literal ID="txtsurname" runat="server" Text="Surname"></asp:Literal>
                    </p>
                </div>
            </div>
            <div class="form-group">
                <label>Username: </label>
                <span class="form-control-static" style="font-size: 18px; font-weight: 200;">
                    <asp:Literal ID="txtusername" runat="server" Text="Shipping Address....Loading...."></asp:Literal></span>
            </div>
            <div class="form-group">
                <label>Billing Address: </label>
                <span class="form-control-static" style="font-size: 18px; font-weight: 400;">
                <asp:Literal ID="txtshippingAddress" runat="server" Text="Shipping Address....Loading...."></asp:Literal></span>
            </div>
            <div class="form-group">
                <label>Shipping Address: </label>
                <span class="form-control-static" style="font-size: 18px; font-weight: 400;">
                <asp:Literal ID="txtbillingAddress" runat="server" Text="Billing Address....Loading...."></asp:Literal></span>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Customer Type</label><br />
                    <p class="h3 badge badge-success" style="font-size: 18px; font-weight: 600;">
                        <asp:Literal ID="txttype" runat="server" Text="PRO"></asp:Literal>
                    </p>
                </div>
                <div class="form-group col-sm-6">
                    <label>Email</label><br />
                    <p class="h3 badge badge-info" style="font-size: 18px; font-weight: 600;">
                        <asp:Literal ID="txtemail" runat="server" Text="username@provider.com"></asp:Literal>
                    </p>
                </div>
                <div class="form-group col-sm-6">
                    <label>Contact Number / Telephone</label><br />
                    <p class="h3 badge badge-warning" style="font-size: 18px; font-weight: 200;">
                        <asp:Literal ID="txtcontact" runat="server" Text="0000000000"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
        </div>
        <div class="tab-pane" id="home2" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="Customer">Ticket Category</label>
                        <select class="form-control" id="lstticketcategory">
                                            <option value="{{x.id}}" ng-repeat="x in dataticketcategory">{{x.name}}</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label for="Customer">Account Manager</label>
                        <select class="form-control" id="lstaccountmanager">
                                            <option value="{{x.id}}" ng-repeat="x in datauser">{{x.fullname}}</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label for="Customer">Assigned To</label>
                        <select class="form-control" id="lstassignedto">
                                            <option value="{{x.id}}" ng-repeat="x in datauser">{{x.fullname}}</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label>Title</label>
                        <input class="form-control" id="txttitle" placeholder="Ticket Title..." />
                    </div>
                    <div class="form-group">
                        <label for="Customer">Order ID</label>
                        <select class="form-control" id="lstorderid">
                                            <option value="{{x.id}}" ng-repeat="x in dataorderid">{{x.reference}}- &euro; {{x.grand_total}}</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label for="Customer">Order Item</label>
                        <select class="form-control" id="lstorderitem">
                                            <option value="{{x.if}}" ng-repeat="x in dataorderid">{{x.reference}}</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label>Tags</label>
                        <input class="form-control" id="txttags" placeholder="Type here..." />
                    </div>
                    <div class="form-group">
                        <label>Additional Notes</label>
                        <textarea placeholder="Notes....?" id="txtnotes"
                                style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 100px;"
                                class="form-control"></textarea>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-sm btn-primary" type="button" ng-click="addTicket()">Submit New Ticket</button>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="home3" role="tabpanel">
            <table class="table table-responsive-sm table-hover table-outline mb-0">
                <thead class="thead-light">
                    <tr>
                        <th class="text-center">
                            Title
                        </th>
                        <th>Category</th>
                        <th class="text-center">Account Manager</th>
                        <th>Rating</th>
                        <th class="text-center">Status</th>
                        <th>Activity</th>
                    </tr>
                </thead>
                <tbody id="gridticketlist">
                    <tr ng-repeat="x in dataticket">
                        <td class="text-center">{{x.title}}</td>
                        <td>{{x.support_ticket_category_id}}</td>
                        <td class="text-center">{{x.backend_user_id}}</td>
                        <td>{{x.rating}}</td>
                        <td class="text-center">{{x.tag}}</td>
                        <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id={{x.uid}}"><i class="fa fa-search-plus"></i></a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="home4" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="Customer">Status</label>
                        <select class="form-control" id="lstticketstatus">
                                            <option value="NEW">NEW</option>
                                            <option value="URGENT">URGENT</option>
                                            <option value="ESCALATE">ESCALATE</option>
                                            <option value="TRANSFER">TRANSFER</option>
                                            <option value="DEMAND">DEMAND</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label>Additional Notes</label>
                        <textarea placeholder="Whats on your mind?" ng-model="update_note"
                                style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 100px;"
                                class="form-control"></textarea>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-sm btn-primary" type="button" ng-click="addUpdate()">Submit</button>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="col-md-4 mt-5 mb-5">
	<div class="row">
		<div class="col-md-12">
			<h4>Latest Internal Update</h4>
			<ul class="timeline">
				<li ng-repeat="x in datarev">
					<span">{{x.head}}</span>
					<p>{{x.body}}</p>
				</li>
			</ul>
		</div>
	</div>
</div>
</div>

<style>
    ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400;
}
ul.timeline > li {
    margin: 20px 0;
    padding-left: 50px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400;
}
</style>