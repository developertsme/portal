<%@ Control Language="C#" AutoEventWireup="true" CodeFile="serviceapi.ascx.cs" Inherits="components_serviceapi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="row">
    <div class="col-md-12 mb-4">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                    <i class="icon-calculator"></i>&nbsp;API List</a>
            </li>

        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="home1" role="tabpanel">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- next -->
                                <div class="card-footer">
                                    <asp:LinkButton ID="lnksubmit" CssClass="btn btn-sm btn-primary" runat="server" OnClientClick="loader()" OnClick="lnksubmit_Click"><i class="fa fa-dot-circle-o"></i>&nbsp;Clear Token List</asp:LinkButton>
                                </div>
                                <div class="card-footer">
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-warning" runat="server" OnClientClick="loader()" OnClick="LinkButton1_Click"><i class="fa fa-dot-circle-o"></i>&nbsp;Generate Token</asp:LinkButton>
                                </div>
                                <br />
                                <div class="row tile_count center">
                                    <div class="col-md-4 col-sm-4 col-xs-6 tile_stats_count">
                                        <span class="count_top"><i class="fa fa-user"></i>Customers/Users</span>
                                        <div class="count green">
                                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">0</asp:LinkButton></div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-6 tile_stats_count">
                                        <span class="count_top"><i class="fa fa-user"></i>Orders</span>
                                        <div class="count green">
                                            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">0</asp:LinkButton></div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-6 tile_stats_count">
                                        <span class="count_top"><i class="fa fa-user"></i>Support Tickets</span>
                                        <div class="count green">
                                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">0</asp:LinkButton></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-header">
                                        <i class="fa fa-align-justify"></i>Token List
                                    </div>
                                    <div class="card-body">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-responsive  col-lg-12">
                                                    <thead>
                                                        <tr>
                                                            <th>Token</th>
                                                            <th>Date</th>
                                                            <th>Is Used</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("token") %></td>
                                                    <td><%# Eval("CreatedOn") %></td>
                                                    <td><%# Eval("isUsed") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                        </table>
                                            </FooterTemplate>
                                        </asp:Repeater>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>

    </div>

</div>
<asp:Literal ID="txtscript" runat="server"></asp:Literal>



<style>
    .tile_count {
        margin-bottom: 20px;
        margin-top: 20px;
    }

    .center {
        text-align: center;
    }

    .tile_count .tile_stats_count {
        border-bottom: 1px solid #D9DEE4;
        padding: 0 10px 10px 20px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        position: relative;
    }

        .tile_count .tile_stats_count span {
            font-size: 12px;
        }

        .tile_count .tile_stats_count .count {
            font-size: 40px;
            line-height: 47px;
            font-weight: 600;
        }

    .green {
        color: #1ABB9C;
    }

    .tile_count .tile_stats_count span {
        font-size: 13px;
    }
</style>
