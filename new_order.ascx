<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_order.ascx.cs" Inherits="components_new_order" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="row">
    <div class="col-md-12 mb-4">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                    <i class="icon-calculator"></i>&nbsp;Order</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="home1" role="tabpanel">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="Customer">Customer <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-search"></i> Search
                                    </button>
                                </span>
                                <asp:TextBox ID="txtcustomer" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:HiddenField ID="txtcustomerid" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Note">Note <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtnote" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Shipping Note <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtshipnote" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>Total Exclude VAT</label>
                                <asp:TextBox ID="txtexcludevat" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Total Include VAT</label>
                                <asp:TextBox ID="txtincludevat" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>Shipping Exclude VAT</label>
                                <asp:TextBox ID="txtshipvat" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Shipping Include VAT</label>
                                <asp:TextBox ID="txtshipincvat" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>Tax Rate Products</label>
                                <asp:TextBox ID="txttaxrate" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Tax Rate Shipping</label>
                                <asp:TextBox ID="txtshiptaxrate" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Grand Total</label>
                            <asp:TextBox ID="txttotal" runat="server" CssClass="form-control is-invalid"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Additional Items</label>
                            <asp:TextBox ID="txtadditem" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton ID="lnksubmit" CssClass="btn btn-sm btn-primary" runat="server" OnClick="lnksubmit_Click" OnClientClick="loader()"><i class="fa fa-dot-circle-o"></i>&nbsp;Submit</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<asp:Literal ID="txtscript" runat="server"></asp:Literal>


<!-- The Modal -->
<div class="modal" id="myModal"  ng-controller="modal_customersearch">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Find Customer</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="input-group">
                    <input class="form-control" ng-model="txtproduct" type="text" name="input3-group2" placeholder="Search">
                    <span class="input-group-prepend">
                        <button class="btn btn-primary" type="button" ng-click="searchUser()">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
                <div class="list-group list-group-accent">
                    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">
                        Results
                        <span class="badge badge-pill badge-danger" id="txtorderlist">{{datalist.length}}</span>
                    </div>
                    <div class="list-group-item list-group-item-accent-warning list-group-item-divider"  ng-repeat="x in datalist">
                            <strong>{{x.name}} {{x.surname}} - {{x.email}}</strong>
                        <br />
                        <small>{{x.tc_company}}</small>
                        <div class="pull-right">
                            <a class="btn btn-info" href="website.aspx?page=new_order&id={{x.uid}}"><i class="fa fa-search"></i> </a>
                        </div>
                    </div>
                    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small"><strong>{{noresult}}</strong></div>
                    
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
