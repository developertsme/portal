<%@ Control Language="C#" AutoEventWireup="true" CodeFile="list_supplier.ascx.cs" Inherits="components_list_supplier" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="bgc-white bd bdrs-3 p-20 mB-20">
    <h4 class="c-grey-900 mB-20">Supplier List <span class="pull-right"><a class="btn btn-primary" href="dashboard.aspx?page=new_supplier">New Supplier</a></span></h4>


    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table id="dataTable" class="table table-striped table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                <thead>
                    <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 196px;">Name</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 294px;">Email</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Contact: activate to sort column ascending" style="width: 149px;">Contact</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Country: activate to sort column ascending" style="width: 52px;">Country</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 124px;">Status</th>
                        <th tabindex="0" rowspan="1" colspan="1" style="width: 124px;">Actions</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr role="row" class="odd">
                <td class="sorting_1"><%#Eval("name") %></td>
                <td><%#Eval("email") %></td>
                <td><%#Eval("contact") %></td>
                <td><%#Eval("country") %></td>
                <td><%#Eval("Status") %></td>
                <td></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr role="row" class="even">
               <td class="sorting_1"><%#Eval("name") %></td>
                <td><%#Eval("email") %></td>
                <td><%#Eval("contact") %></td>
                <td><%#Eval("country") %></td>
                <td><%#Eval("Status") %></td>
                <td></td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </tbody>
        </table>
        </FooterTemplate>
    </asp:Repeater>


</div>

