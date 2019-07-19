<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supportticketlist.ascx.cs" Inherits="components_supportticketlist" %>


<div class="row">
    
    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body p-0 d-flex align-items-center">
                <i class="fa fa-cogs bg-primary p-4 px-5 font-2xl mr-3"></i>
                <div>
                    <div class="text-value-sm text-primary">Naruto</div>
                    <div class="text-muted text-uppercase font-weight-bold small">Waiting Support</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body p-0 d-flex align-items-center">
                <i class="fa fa-laptop bg-info p-4 px-5 font-2xl mr-3"></i>
                <div>
                    <div class="text-value-sm text-info">Berserk</div>
                    <div class="text-muted text-uppercase font-weight-bold small">Waiting Answer</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body p-0 d-flex align-items-center">
                <i class="fa fa-moon-o bg-warning p-4 px-5 font-2xl mr-3"></i>
                <div>
                    <div class="text-value-sm text-warning">Sailor Moon</div>
                    <div class="text-muted text-uppercase font-weight-bold small">Latest Ticket</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body p-0 d-flex align-items-center">
                <i class="fa fa-bell bg-danger p-4 px-5 font-2xl mr-3"></i>
                <div>
                    <div class="text-value-sm text-danger">Narutor</div>
                    <div class="text-muted text-uppercase font-weight-bold small">Oldest Ticket</div>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="row">
<div class="col-lg-12">
    <div class="animated fadeIn">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-edit"></i>Support Ticket List
            <div class="card-header-actions breadcrumb-menu">
                <button class="card-header-action label btn-sm btn-success" type="button" data-toggle="modal" data-target="#myModal">
                    New Support Ticket
                </button>
            </div>
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <div class="col-md-12">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="LinkButton1" CssClass="col-md-12">
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <asp:LinkButton ID="LinkButton1" OnClientClick="loader();" CssClass="btn btn-primary" runat="server" OnClick="LinkButton1_Click"> <i class="fa fa-search"></i> Deep Search</asp:LinkButton>
                                </span>
                                <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Didnt find what you are looking for?" autocomplete="off"></asp:TextBox>
                            </div>
                        </asp:Panel>
                        <asp:Literal ID="lblerror" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table class="table table-responsive-sm table-striped table-sm" data-toggle="table"
                            data-pagination="true"
                            data-search="true"
                            data-show-pagination-switch="true"
                            data-switchable="true"
                            data-show-columns="true"
                            data-sort-name="0"
                            data-sort-order="desc"
                            data-minimum-count-columns="2"
                            data-show-refresh="true"
                            data-show-toggle="true"
                            data-page-list="[10, 25, 50, 100, ALL]">
                            <thead>
                                <tr>
                                    <th data-sortable="true" data-visible="false">ID</th>
                                    <th data-sortable="true">Category</th>
                                    <th data-sortable="true">Title</th>
                                    <th data-sortable="true">Full Name / EMail</th>
                                    <th data-sortable="true">Updated On</th>
                                    <th data-sortable="true">Closed?</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("id")%></td>
                            <td><%# Eval("category") %> </td>
                            <td><%# Eval("title")%></td>
                            <td><%# Eval("Customer")%></td>
                            <td><%# Eval("UpdatedOn")%></td>
                            <td><%# Eval("is_closed")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a>
                                <a class="btn btn-info" href="#" onclick="sidetab1('ticket','<%# Eval("uid")%>')"><i class="fa fa-eye"></i></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td><%# Eval("id")%></td>
                            <td><%# Eval("category") %> </td>
                            <td><%# Eval("title")%></td>
                            <td><%# Eval("Customer")%></td>
                            <td><%# Eval("UpdatedOn")%></td>
                            <td><%# Eval("is_closed")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a>
                                <a class="btn btn-info" href="#" onclick="sidetab1('ticket','<%# Eval("uid")%>')"><i class="fa fa-eye"></i></a>

                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </tbody>
        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>
    </div>


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
                            <a class="btn btn-info" href="website.aspx?page=new_ticket&id={{x.uid}}"><i class="fa fa-search"></i> </a>
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
