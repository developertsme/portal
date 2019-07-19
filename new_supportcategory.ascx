<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_supportcategory.ascx.cs" Inherits="components_new_supportcategory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="col-md-12 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home3" role="tab" aria-controls="home">
                <i class="icon-calculator"></i>&nbsp; New Support Category</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="home3" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-sm-6">
                        <label for="Customer">Parent Category</label>
                        <telerik:RadComboBox AllowCustomText="False" AppendDataBoundItems="true" ShowMoreResultsBox="True" MarkFirstMatch="True" ID="txtparent" Skin="MetroTouch" Width="100%" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="--Please Select--" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                        <div class="form-group col-sm-6">
                            <label>Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info btn-lg btn-block" runat="server" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</div>
