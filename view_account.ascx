<%@ Control Language="C#" AutoEventWireup="true" CodeFile="view_account.ascx.cs" Inherits="components_view_account" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="row" >
<div class="col-md-12 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                <i class="icon-calculator"></i>&nbsp;Backend Account Update</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="home1" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtfullname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Email</label>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Username</label>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Password</label>
                            <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Short Name</label>
                            <asp:TextBox ID="txtshort" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtlastname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6"">
                        <label>Member ID</label>
                        <asp:TextBox ID="txtmemid" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-sm-6"">
                        <label>Branch</label>
                        <asp:TextBox ID="txtbranch" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <telerik:RadComboBox ShowMoreResultsBox="True" MarkFirstMatch="True" ID="txtrole" Skin="MetroTouch" Width="100%" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="--Please Select--" Value="" />
                                <telerik:RadComboBoxItem runat="server" Text="Administrator" Value="admin" />
                                <telerik:RadComboBoxItem runat="server" Text="Manager" Value="manager" />
                                <telerik:RadComboBoxItem runat="server" Text="Sales Agent" Value="sales" />
                                <telerik:RadComboBoxItem runat="server" Text="Customer Support" Value="support" />
                                <telerik:RadComboBoxItem runat="server" Text="Stock Controller" Value="control" />
                                <telerik:RadComboBoxItem runat="server" Text="Procurement" Value="purchase" />
                            </Items>
                        </telerik:RadComboBox>
                   
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <telerik:RadComboBox  ShowMoreResultsBox="true" AppendDataBoundItems="true" MarkFirstMatch="true" ID="txtcountry" Skin="MetroTouch" Width="100%" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="--Please Select--" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                   
                    </div>
                </div>
                <div class="card-footer">
                    <asp:LinkButton ID="lnksubmit" CssClass="btn btn-sm btn-success" runat="server" OnClick="lnksubmit_Click" OnClientClick="loader()"><i class="fa fa-dot-circle-o"></i>&nbsp;Submit</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

</div>

</div>
<asp:Literal ID="txtscript" runat="server"></asp:Literal>