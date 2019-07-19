<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supportCategorylist.ascx.cs" Inherits="components_supportCategorylist" %>

<div class="row">
    
    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body p-0 d-flex align-items-center">
                <i class="fa fa-cogs bg-primary p-4 px-5 font-2xl mr-3"></i>
                <div>
                    <div class="text-value-sm text-primary">Naruto</div>
                    <div class="text-muted text-uppercase font-weight-bold small">Most Subcategory</div>
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
                    <div class="text-muted text-uppercase font-weight-bold small">Least Subcategory</div>
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
                    <div class="text-muted text-uppercase font-weight-bold small">Latest Category</div>
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
                    <div class="text-muted text-uppercase font-weight-bold small">Oldest Category</div>
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
                <i class="fa fa-edit"></i>Support Category List
             <div class="card-header-actions breadcrumb-menu">
                <a class="card-header-action label btn-sm btn-success" href="?page=new_supportcategory" target="_blank">
                    New Support Category
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
                                    <th data-sortable="true">Name</th>
                                    <th data-sortable="true">Parent ID</th>
                                    <th data-sortable="true">Updated On</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("id")%></td>
                            <td><%# Eval("name")%></td>
                            <td><%# Eval("parent_id")%></td>
                            <td><%# Eval("UpdatedOn")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_category&id=<%# Eval("id")%>"><i class="fa fa-search-plus"></i></a></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td><%# Eval("id")%></td>
                            <td><%# Eval("name")%></td>
                            <td><%# Eval("parent_id")%></td>
                            <td><%# Eval("UpdatedOn")%></td>
                            <td><a class="btn btn-success" href="website.aspx?page=view_category&id=<%# Eval("id")%>"><i class="fa fa-search-plus"></i></a></td>
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