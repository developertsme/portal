<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_user.ascx.cs" Inherits="components_new_user" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="col-md-12 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home3" role="tab" aria-controls="home">
                <i class="icon-calculator"></i>&nbsp; New Account</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="home3" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Surname</label>
                            <asp:TextBox ID="txtsurname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Username</label>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Email</label>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Customer">Country</label>
                        <telerik:RadComboBox AllowCustomText="true" ShowMoreResultsBox="true" MarkFirstMatch="true" ID="txtcountry" Skin="MetroTouch" Width="100%" runat="server"></telerik:RadComboBox>
                    </div>
                    <div class="form-group">
                        <label for="Note">Billing Address</label>
                        <asp:TextBox ID="txtbill" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="Note">Shipping Address</label>
                        <asp:TextBox ID="txtship" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                     <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Contact Number</label>
                            <asp:TextBox ID="txtno" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                        <label for="Customer">Account Type</label>
                        <telerik:RadComboBox AllowCustomText="True" ShowMoreResultsBox="True" MarkFirstMatch="True" ID="txttype" Skin="MetroTouch" Width="100%" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Guest" Value="Guest" />
                                <telerik:RadComboBoxItem runat="server" Text="Customer" Value="Customer" />
                                <telerik:RadComboBoxItem runat="server" Text="PRO" Value="PRO" />
                                <telerik:RadComboBoxItem runat="server" Text="Supplier" Value="Supplier" />
                                <telerik:RadComboBoxItem runat="server" Text="User" Value="User" />
                                <telerik:RadComboBoxItem runat="server" Text="Manager" Value="Manager" />
                                <telerik:RadComboBoxItem runat="server" Text="Admin" Value="Admin" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                    </div>
                    
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info btn-lg btn-block" runat="server" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</div>
