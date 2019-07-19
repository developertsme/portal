<%@ Control Language="C#" AutoEventWireup="true" CodeFile="profile.ascx.cs" Inherits="components_profile" %>

<link href="/css/AdminLTE.min.css" rel="stylesheet">
<asp:Literal ID="txtlabel" runat="server"></asp:Literal>
<section class="content" ng-controller="main_profile">
    <div class="row">
        <div class="col-md-3">
            <asp:HiddenField ID="fusername" ClientIDMode="Static" runat="server" />
            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <div style="text-align: center">
                        <img class="profile-user-img img-responsive img-circle" src="images/user.png" alt="Contact Profile">
                    </div>
                    <h3 class="profile-username text-center">
                        <asp:Literal ID="txtfullname" runat="server"></asp:Literal></h3>

                    <p class="text-muted text-center">
                        <asp:Literal ID="txtemail" runat="server"></asp:Literal>
                    </p>
                    <p class="text-muted text-center">
                        <strong>
                            <asp:Literal ID="txtaccountid" runat="server"></asp:Literal></strong>
                    </p>
                    <p class="text-muted text-center">
                        <asp:Literal ID="txtcategory" runat="server"></asp:Literal>
                    </p>
                </div>
                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-block" runat="server" OnClick="LinkButton1_Click">View</asp:LinkButton>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                        <i class="icon-calculator"></i>&nbsp;Tasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#home2" role="tab" aria-controls="home2">
                        <i class="icon-calculator"></i>&nbsp; To DO List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#home5" role="tab" aria-controls="home5">
                        <i class="icon-calculator"></i>&nbsp;Change Password</a>
                </li>
            </ul>
            <div class="tab-content" style="border: 0px;">
                <div class="tab-pane active" id="home1" role="tabpanel">
                    <div class="card"  style="padding:20px;">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table class="table table-responsive-sm table-striped table-sm" data-toggle="table"
                                    data-pagination="true"
                                    data-search="true"
                                    data-show-pagination-switch="true"
                                    data-switchable="true"
                                    data-show-columns="true"
                                    data-sort-name="0"
                                    data-sort-order="desc"
                                    data-minimum-count-columns="2"
                                    data-show-refresh="true"
                                    data-show-toggle="true"
                                    data-page-list="[10, 25, 50, 100, ALL]">
                                    <thead>
                                        <tr>
                                            <th data-sortable="true" data-visible="false">ID</th>
                                            <th data-sortable="true" data-visible="false">Assigned To</th>
                                            <th data-sortable="true">Subject</th>
                                            <th data-sortable="true">Reminder</th>
                                            <th data-sortable="true">Status</th>
                                            <th data-sortable="true">Deadline</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("id")%></td>
                                    <td><%# Eval("assignTo")%></td>
                                    <td><%# Eval("subject")%></td>
                                    <td><%# Eval("reminder") %></td>
                                    <td><span class="badge label-success"><%# Eval("status")%></span></td>
                                    <td><%# Convert.ToDateTime(Eval("deadline")).ToShortDateString() %></td>
                                    <td><a class="btn btn-info" onclick="sidetab1('task','<%# Eval("id")%>')"><i class="fa fa-eye"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr>
                                    <td><%# Eval("id")%></td>
                                    <td><%# Eval("assignTo")%></td>
                                    <td><%# Eval("subject")%></td>
                                    <td><%# Eval("reminder") %></td>
                                    <td><span class="badge label-success"><%# Eval("status")%></span></td>
                                    <td><%# Convert.ToDateTime(Eval("deadline")).ToShortDateString() %></td>
                                    <td><a class="btn btn-info" onclick="sidetab1('task','<%# Eval("id")%>')"><i class="fa fa-eye"></i></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </tbody>
        </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <!-- table tasks -->
                    </div>
                </div>
                <div class="tab-pane" id="home2" role="tabpanel">
                    <div class="card" style="padding:20px;">
                         <div class="row">
                                <div class="form-group col-sm-8">
                                <label>Subject</label><input type="text" placeholder="Enter your Task" class="form-control" id="txttasksubject"/></div>
                             <div class="form-group col-sm-4">
                                    <label>Deadline</label><input type="date" class="form-control" id="txttaskdatetime"/></div>
                            </div>
                        <section class="simple-compose-box mb-xlg">
                            <textarea placeholder="Notes..." id="txtnote"
                                style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 100px;"
                                class="form-control"></textarea>
                            <div class="compose-box-footer">
                                <ul class="compose-toolbar">
                                    <li>
                                        <a href="#"><i class="fa fa-paperclip"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-map-marker"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </section>
                         <div class="row">
                                <div class="form-group col-sm-4">
                                <label>Reminder</label><select class="form-control" id="txtreminder">
                                         <option>-- select --</option>
                                        <option>Email</option>
                                        <option>Queue</option>
                                        <option>Dashboard</option>
                                    </select></div>
                             <div class="form-group col-sm-4">
                                    <label>Assigned To</label>
                                 <select class="form-control" id="txtassignto">
                                     <option value="">--ASSIGN TO SELF--</option>
                                         <option value="{{x.id}}" ng-repeat="x in datauser">{{x.fullname}}</option>
                                    </select></div>
                             </div>
                         <section class="simple-compose-box mb-xlg">
                            <div class="compose-box-footer">
                                <ul class="compose-btn">
                                    <li>
                                        <button class="btn btn-info btn-xs" type="button" ng-click="addTask()">Post</button>
                                    </li>
                                </ul>
                            </div>
                        </section>
                            </div>
                </div>
                <div class="tab-pane" id="home5" role="tabpanel">
                    <div class="card" style="padding: 20px;">
                        <div class="form-group col-sm-12">
                            <label>Current Password</label>
                            <asp:TextBox ID="txtcurrent" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>New Password</label>
                                <asp:TextBox ID="txtnew" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Re-Type New Password</label>
                                <asp:TextBox ID="txtretype" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <section class="simple-compose-box mb-xlg">
                            <div class="compose-box-footer">
                                <ul class="compose-btn">
                                    <li>
                                        <asp:Button CssClass="btn btn-info btn-xs" ID="Button1" runat="server" Text="Change Password" />
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <div>
    </div>
</section>




<style>
    li {
        list-style: none !important;
    }

    .tab-content .tab-pane {
        padding: 0rem !important;
    }
    /* Widget - Simple Compose Box */
    .simple-compose-box {
        border: 1px solid #d1d1d1;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        background-color: #fff;
    }

        .simple-compose-box textarea {
            background-color: transparent;
            display: block;
            width: 100%;
            padding: 10px 10px 5px;
            border: 0;
            resize: none;
            -webkit-border-radius: 3px;
            border-radius: 3px;
        }

            .simple-compose-box textarea:focus {
                border: 0 none;
                outline: none;
            }

        .simple-compose-box .compose-box-footer {
            background-color: #F6F7F8;
            -webkit-border-radius: 0 0 5px 5px;
            border-radius: 0 0 5px 5px;
        }

            .simple-compose-box .compose-box-footer:after {
                content: "";
                display: table;
                clear: both;
            }

            .simple-compose-box .compose-box-footer .compose-toolbar {
                list-style: none;
                margin: 0;
                padding: 0 3px;
                float: left;
            }

                .simple-compose-box .compose-box-footer .compose-toolbar li {
                    display: inline-block;
                }

                    .simple-compose-box .compose-box-footer .compose-toolbar li a {
                        display: block;
                        text-align: center;
                        font-size: 16px;
                        line-height: 30px;
                        width: 30px;
                        color: #B3B7BD;
                    }

                        .simple-compose-box .compose-box-footer .compose-toolbar li a:hover {
                            background-color: #e8eaed;
                        }

            .simple-compose-box .compose-box-footer .compose-btn {
                list-style: none;
                margin: 0;
                padding: 3px;
                float: right;
            }
</style>
