<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_licenses.ascx.cs" Inherits="components_new_licenses" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="col-md-12 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                <i class="icon-calculator"></i>Licenses</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="home1" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="Customer">Status</label>
                        <telerik:RadComboBox AllowCustomText="true" ShowMoreResultsBox="true" MarkFirstMatch="true" ID="txtstat" Skin="MetroTouch" Width="100%" runat="server"></telerik:RadComboBox>
                    </div>
                    <div class="form-group">
                        <label>Brand Name</label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="card-footer">
                        <asp:LinkButton ID="lnksubmit" CssClass="btn btn-sm btn-primary" runat="server"><i class="fa fa-dot-circle-o"></i>Submit</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

</div>