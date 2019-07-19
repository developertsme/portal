<%@ Control Language="C#" AutoEventWireup="true" CodeFile="shopsList.ascx.cs" Inherits="components_shopsList" %>

<div class="col-lg-12">
    <div class="animated fadeIn">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-edit"></i>Shops List
            <div class="card-header-actions breadcrumb-menu">
                <a class="card-header-action label btn-sm btn-success" href="?page=new_shop" target="_blank">
                    New Shop
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
                                    <th data-sortable="true">User ID</th>
                                    <th data-sortable="true">Shop ID</th>
                                    <th data-sortable="true">Shop Name</th>
                                    <th data-sortable="true" data-visible="false">Contact 1</th>
                                    <th data-sortable="true" data-visible="false">Contact 2</th>
                                    <th data-sortable="true">Country</th>
                                    <th data-sortable="true">Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("id")%></td>
                            <td><%# Eval("userid")%></td>
                            <td><%# Eval("shopid")%></td>
                            <td><%# Eval("shopname") %></td>
                            <td><%# Eval("contactname")%></td>
                            <td><%# Eval("contactname2")%></td>
                            <td><%# Eval("countryid")%></td>
                            <td><%# Eval("status")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_shop&id=<%# Eval("id")%>"><i class="fa fa-pen"></i></a>
                                <a class="btn btn-success" href="website.aspx?page=view_eyeshop&id=<%# Eval("id")%>"><i class="fa fa-search-plus"></i></a>
                                <a class="btn btn-info" onclick="sidetab1('shop','<%# Eval("id")%>')"><i class="fa fa-eye"></i></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td><%# Eval("id")%></td>
                            <td><%# Eval("userid")%></td>
                            <td><%# Eval("shopid")%></td>
                            <td><%# Eval("shopname") %></td>
                            <td><%# Eval("contactname")%></td>
                            <td><%# Eval("contactname2")%></td>
                            <td><%# Eval("countryid")%></td>
                            <td><%# Eval("status")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_shop&id=<%# Eval("id")%>"><i class="fa fa-pen"></i></a>
                                <a class="btn btn-success" href="website.aspx?page=view_eyeshop&id=<%# Eval("id")%>"><i class="fa fa-search-plus"></i></a>
                                <a class="btn btn-info" onclick="sidetab1('shop','<%# Eval("id")%>')"><i class="fa fa-eye"></i></a>
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