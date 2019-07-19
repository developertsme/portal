<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supportDashboard.ascx.cs" Inherits="components_supportDashboard" %>
<div class="row tile_count center">
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-user"></i>Open Tickets</span>
        <div class="count green"><asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
        <span class="count_bottom"><i class="green"><asp:Literal ID="Literal2" runat="server"></asp:Literal> </i>For later</span>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-user"></i>Needs Answer</span>
        <div class="count green"><asp:Literal ID="Literal3" runat="server"></asp:Literal></div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-user"></i>Waiting for Customer</span>
        <div class="count green"><asp:Literal ID="Literal4" runat="server"></asp:Literal></div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-user"></i>New Tickets</span>
        <div class="count green"><asp:Literal ID="Literal5" runat="server"></asp:Literal></div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-user"></i>Latest Support Message</span>
        <div class="count green"><asp:Literal ID="Literal6" runat="server"></asp:Literal></div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
        <span class="count_top"><i class="fa fa-user"></i>Urgent Tickets</span>
        <div class="count green"><asp:Literal ID="Literal7" runat="server"></asp:Literal></div>
        <span class="count_bottom"><i class="green"><asp:Literal ID="Literal8" runat="server"></asp:Literal></i> Not urgent</span>
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">New Tickets &amp; Urgent Tickets</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table class="table table-responsive-sm table-hover table-outline mb-0">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>User / Title</th>
                                            <th class="text-center">Created On</th>
                                            <th class="text-center">Tag</th>
                                            <th>Activity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                             </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div><%# Eval("title") %></div>
                                        <div class="small text-muted">
                                           <%# Eval("author_email") %>
                                        </div>
                                    </td>
                                    <td class="text-center"><%# Eval("CreatedOn") %></td>
                                    <td><span class="badge badge-info"><%# Eval("tag") %></span></td>
                                    <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a></td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr>
                                    <td>
                                        <div><%# Eval("title") %></div>
                                        <div class="small text-muted">
                                           <%# Eval("author_email") %>
                                        </div>
                                    </td>
                                    <td class="text-center"><%# Eval("CreatedOn") %></td>
                                    <td><span class="badge badge-info"><%# Eval("tag") %></span></td>
                                    <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                 </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    
                            
                       
                    </div>
                    <div class="col-md-6">
                    <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <table class="table table-responsive-sm table-hover table-outline mb-0">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>User / Title</th>
                                            <th class="text-center">Created On</th>
                                            <th class="text-center">Tag</th>
                                            <th>Activity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                             </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div><%# Eval("title") %></div>
                                        <div class="small text-muted">
                                           <%# Eval("author_email") %>
                                        </div>
                                    </td>
                                    <td class="text-center"><%# Eval("CreatedOn") %></td>
                                    <td><span class="badge badge-danger"><%# Eval("tag") %></span></td>
                                    <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a></td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr>
                                    <td>
                                        <div><%# Eval("title") %></div>
                                        <div class="small text-muted">
                                           <%# Eval("author_email") %>
                                        </div>
                                    </td>
                                    <td class="text-center"><%# Eval("CreatedOn") %></td>
                                    <td><span class="badge badge-danger"><%# Eval("tag") %></span></td>
                                    <td><a class="btn btn-success" href="website.aspx?page=view_supportticket&id=<%# Eval("uid")%>"><i class="fa fa-search-plus"></i></a></td>
                                </tr>
                            </AlternatingItemTemplate>
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
