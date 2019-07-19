<%@ Control Language="C#" AutoEventWireup="true" CodeFile="list_locations.ascx.cs" Inherits="components_list_locations" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="bgc-white bd bdrs-3 p-20 mB-20">
    <h4 class="c-grey-900 mB-20">Location List <span class="pull-right"><a class="btn btn-primary" href="dashboard.aspx?page=new_location">New Location</a></span></h4>


    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table id="dataTable" class="table table-striped table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                <thead>
                    <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 196px;">Name</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Location: activate to sort column ascending" style="width: 294px;">Location</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Barcode: activate to sort column ascending" style="width: 149px;">Barcode</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Type: activate to sort column ascending" style="width: 52px;">Type</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 124px;">Status</th>
                        <th tabindex="0" rowspan="1" colspan="1" style="width: 124px;">Actions</th>
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

