<%@ Control Language="C#" AutoEventWireup="true" CodeFile="search_result.ascx.cs" Inherits="components_search_result" %>


<div class="col-lg-12">
    <div class="animated fadeIn">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-edit"></i>Search Results
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <div class="col-md-12">
                        <asp:Literal ID="lblerror" runat="server"></asp:Literal>
                        <asp:Literal ID="lblerror2" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
            <div class="card-body">

                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Customers / Users</a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body card-body">
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
                                                    <th data-sortable="true">Name/Surname</th>
                                                    <th data-sortable="true">Email</th>
                                                    <th data-sortable="true">Username</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("id")%></td>
                                            <td><%# Eval("name")%> <%# Eval("surname")%></td>
                                            <td><%# Eval("email")%></td>
                                            <td><%# Eval("username")%></td>
                                            <td><a onclick="loader();" class="btn btn-success" href="website.aspx?page=view_user&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr>
                                            <td><%# Eval("id")%></td>
                                            <td><%# Eval("name")%> <%# Eval("surname")%></td>
                                            <td><%# Eval("email")%></td>
                                            <td><%# Eval("username")%></td>
                                            <td><a onclick="loader();" class="btn btn-success" href="website.aspx?page=view_user&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a></td>
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Orders</a>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body card-body">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Support Tickets</a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body card-body">
                                <asp:Repeater ID="Repeater2" runat="server">
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
        </div>
    </div>
</div>


