<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_shop.ascx.cs" Inherits="components_new_shop" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="row">
    <div class="col-md-12 mb-4">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                    <i class="icon-calculator"></i>&nbsp;Shop</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="home1" role="tabpanel">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>User ID</label>
                                <telerik:RadComboBox AllowCustomText="true" AppendDataBoundItems="true" ShowMoreResultsBox="true" MarkFirstMatch="true" ID="txtcustomer" Skin="MetroTouch" Width="100%" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Value="" Text="--Not a Registered Customer" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="Customer">Shop ID (Website) </label>
                               <asp:TextBox ID="txtwebsiteid" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>Shop Name<span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtshopname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Email<span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>1st Contact Name</label>
                                <asp:TextBox ID="txtname1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>1st Contact Email/Number</label>
                                <asp:TextBox ID="txtcontact1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>2nd Contact Name</label>
                                <asp:TextBox ID="txtname2" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>2nd Contact Email/Number</label>
                                <asp:TextBox ID="txtcontact2" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Country</label>
                            <telerik:RadComboBox AllowCustomText="true" ShowMoreResultsBox="true" MarkFirstMatch="true" ID="txtcountry" Skin="MetroTouch" Width="100%" runat="server"></telerik:RadComboBox>

                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton ID="lnksubmit" CssClass="btn btn-sm btn-primary" runat="server" OnClick="lnksubmit_Click" OnClientClick="loader()"><i class="fa fa-dot-circle-o"></i>&nbsp;Submit</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<asp:Literal ID="txtscript" runat="server"></asp:Literal>