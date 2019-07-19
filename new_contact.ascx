<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_contact.ascx.cs" Inherits="components_new_contact" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="row" >
<div class="col-md-12 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                <i class="icon-calculator"></i>&nbsp;Contact</a>
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
                            <label>Job Title</label>
                            <asp:TextBox ID="txtjobtitle" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Phone Number</label>
                            <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label>Company Name</label>
                            <asp:TextBox ID="txtcompany" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Company Size</label>
                            <asp:TextBox ID="txtcompanysize" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6"">
                        <label>Sales Signup/Person</label>
                        <asp:TextBox ID="txtsalessignup" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-sm-6"">
                        <label>Contact Status</label>
                        <asp:TextBox ID="txtcontactstatus" runat="server" CssClass="form-control"></asp:TextBox>
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