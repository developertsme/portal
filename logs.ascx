<%@ Control Language="C#" AutoEventWireup="true" CodeFile="logs.ascx.cs" Inherits="components_logs" %>
<div class="row">
    <div class="col-lg-12">
        <div class="animated fadeIn">
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-edit"></i>Log Files
                <div class="card-header-actions breadcrumb-menu">
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-refresh"></i></asp:LinkButton>
                </div>


                </div>
            <div class="card-body">
                <div class="table-responsive  form-horizontal form-label-left">
                    <!-- content -->
                    <asp:Literal ID="txtcontent" runat="server"></asp:Literal>
                    <!-- end content -->
                </div>
            </div>
        </div>
    </div>
</div>
</div>