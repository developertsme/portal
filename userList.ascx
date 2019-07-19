<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userList.ascx.cs" Inherits="sidetab2_userList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="list-group list-group-accent">
    <div class="list-group-item list-group-item-accent-secondary bg-light text-center font-weight-bold text-muted text-uppercase small">Customer Update</div>
    <div class="list-group-item list-group-item-accent-warning list-group-item-divider">
        <div>
            Name:<br />
            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div>
            Surname:<br />
            <asp:TextBox ID="txtsurname" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <small class="text-muted"><i class="icon-user"></i>&nbsp; Username:<br />
            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox></small>
         <small class="text-muted"> Email:<br />
            <strong><asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox></strong>
        </small>
        <small class="text-muted"> Contact No.:<br />
            <strong><asp:TextBox ID="txtcontact" runat="server" CssClass="form-control"></asp:TextBox></strong>
        </small>
        <small class="text-muted"> <i class="icon-location-pin"></i>&nbsp;Billing Address:<br />
             <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox></small>
        <small class="text-muted"><i class="icon-location-pin"></i>&nbsp; Shipping Address:<br />
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox> </small>
        
        <small class="text-muted">  <i class="icon-flag"></i>&nbsp;Country:<br />
           <telerik:RadComboBox AllowCustomText="true" ShowMoreResultsBox="true" MarkFirstMatch="true" ID="txtcountry" Skin="MetroTouch" Width="100%" runat="server"></telerik:RadComboBox>
                    </small>
        <small class="text-muted">  <i class="icon-flag"></i>&nbsp;Customer Type:<br />
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
                    </small>
    </div>

    <br />
    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info btn-lg btn-block" runat="server"  OnClientClick="loader();" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
</div>