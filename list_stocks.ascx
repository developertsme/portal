<%@ Control Language="C#" AutoEventWireup="true" CodeFile="list_stocks.ascx.cs" Inherits="components_list_stocks" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="col-lg-12">
    <div class="animated fadeIn">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-edit"></i>Stock Inventory List
            <div class="card-header-actions breadcrumb-menu">
                <a class="card-header-action label btn-sm btn-success" href="?page=new_stock" target="_blank">
                    New Stock
                </a>
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
                    <tr role="row">
                        <th data-sortable="true">Name</th>
                        <th data-sortable="true">Location</th>
                        <th data-sortable="true">Barcode</th>
                        <th data-sortable="true">Type</th>
                        <th data-sortable="true">Qty</th>
                        <th data-sortable="true">Status</th>
                        <th data-sortable="true">Actions</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr role="row" class="odd">
                <td class="sorting_1"><%#Eval("name") %></td>
                <td><%#Eval("location") %></td>
                <td><%#Eval("barcode") %></td>
                <td><%#Eval("type") %></td>
                <td><%#Eval("qty") %></td>
                <td><span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill"><%#Eval("status") %></span></td>
                <td></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr role="row" class="even">
                <td class="sorting_1"><%#Eval("name") %></td>
                <td><%#Eval("location") %></td>
                <td><%#Eval("barcode") %></td>
                <td><%#Eval("type") %></td>
                <td><%#Eval("qty") %></td>
                <td><span class="badge bgc-red-50 c-red-700 p-10 lh-0 tt-c badge-pill"><%#Eval("status") %></span></td>
                <td></td>
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


