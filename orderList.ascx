<%@ Control Language="C#" AutoEventWireup="true" CodeFile="orderList.ascx.cs" Inherits="components_orderList" %>

<div class="col-lg-12">
    <div class="animated fadeIn">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-edit"></i>Orders List
            <div class="card-header-actions breadcrumb-menu">
                <a class="card-header-action label btn-sm btn-success" href="?page=new_order" target="_blank">
                    New Order
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
                                <tr>
                                    <th data-sortable="true" data-visible="false">ID</th>
                                    <th data-sortable="true">Account</th>
                                    <th data-sortable="true">Reference</th>
                                    <th data-sortable="true" data-visible="false">Note</th>
                                    <th data-sortable="true" data-visible="false">Shipping Note</th>
                                    <th data-sortable="true" data-visible="false">Billing Address</th>
                                    <th data-sortable="true" data-visible="false">Shipping Address</th>
                                    <th data-sortable="true">Total VAT</th>
                                    <th data-sortable="true">Total Shipping VAT</th>
                                    <th data-sortable="true">Grand Total</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("uid")%></td>
                            <td><%# Eval("account_id")%></td>
                            <td><%# Eval("reference") %></td>
                            <td><%# Eval("note")%></td>
                            <td><%# Eval("note_shipping")%></td>
                            <td><%# Eval("address_billing_id")%></td>
                            <td><%# Eval("address_billing_id")%></td>
                            <td><%# Eval("total_include_vat")%></td>
                            <td><%# Eval("shipping_include_vat")%></td>
                            <td><%# Eval("grand_total")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_order&orderid=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a>
                                <a class="btn btn-info" href="#" onclick="sidetab1('order','<%# Eval("uid")%>')"><i class="fa fa-eye"></i></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td><%# Eval("uid")%></td>
                            <td><%# Eval("account_id")%></td>
                            <td><%# Eval("reference") %></td>
                            <td><%# Eval("note")%></td>
                            <td><%# Eval("note_shipping")%></td>
                            <td><%# Eval("address_billing_id")%></td>
                            <td><%# Eval("address_billing_id")%></td>
                            <td><%# Eval("total_include_vat")%></td>
                            <td><%# Eval("shipping_include_vat")%></td>
                            <td><%# Eval("grand_total")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_order&orderid=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a>
                                 <a class="btn btn-info" href="#" onclick="sidetab1('order','<%# Eval("uid")%>')"><i class="fa fa-eye"></i></a>
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