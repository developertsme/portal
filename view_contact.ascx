<%@ Control Language="C#" AutoEventWireup="true" CodeFile="view_contact.ascx.cs" Inherits="components_view_contact" %>
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
<link href="/css/AdminLTE.min.css" rel="stylesheet">
<section class="content"  ng-controller="main_contact">
    <div class="row">
        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <div style="text-align: center">
                        <img class="profile-user-img img-responsive img-circle" src="images/user.png" alt="Contact Profile">
                    </div>
                    <h3 class="profile-username text-center">
                        <asp:Literal ID="txtfullname" runat="server"></asp:Literal></h3>

                    <p class="text-muted text-center">
                        <asp:Literal ID="txtemail" runat="server"></asp:Literal></p>

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b>
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal></b>
                        </li>
                        <li class="list-group-item">
                            <b>
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal></b>
                        </li>
                        <li class="list-group-item">
                            <b>
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal></b>
                        </li>
                        <li class="list-group-item">
                            <b>
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal></b>
                        </li>
                        <li class="list-group-item">
                            <b>
                                <asp:Literal ID="Literal5" runat="server"></asp:Literal></b>
                        </li>
                    </ul>

                    <a href="#" class="btn btn-primary btn-block"><b>Update</b></a>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->

            <!-- About Me Box -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">About</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <strong><i class="fa fa-book margin-r-5"></i>Address</strong>

                    <p class="text-muted">
                        <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                    </p>

                    <hr>

                    <strong><i class="fa fa-map-marker margin-r-5"></i>Country</strong>

                    <p class="text-muted">
                        <asp:Literal ID="Literal7" runat="server"></asp:Literal></p>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                        <i class="icon-calculator"></i>&nbsp;New Note</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#home2" role="tab" aria-controls="home2">
                        <i class="icon-calculator"></i>&nbsp;Email</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#home3" role="tab" aria-controls="home3">
                        <i class="icon-calculator"></i>&nbsp;Log Activity</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#home5" role="tab" aria-controls="home5">
                        <i class="icon-calculator"></i>&nbsp;Create Task</a>
                </li>
            </ul>
            <div class="tab-content" style="border:0px;">
                <div class="tab-pane active" id="home1" role="tabpanel">
                    <div class="card">
                        <section class="simple-compose-box mb-xlg">
                            <textarea placeholder="Whats on your mind?" ng-model="activity_note"
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
                                <ul class="compose-btn">
                                    <li>
                                        <button class="btn btn-info btn-xs" type="button" ng-click="addNote()">Post</button>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="tab-pane" id="home2" role="tabpanel">
                    <div class="card" style="padding:20px;">

                        <div class="form-group">
                            <label>To<span class="text-danger">*</span></label>
                            <input class="form-control" id="txtto"  ng-model="emailto"/>
                        </div>
                        <div class="form-group">
                            <label>CC<span class="text-danger"></span></label>
                            <input class="form-control" id="txtcc" placeholder="Email cc list" ng-model="emailcc" />
                        </div>
                        <div class="form-group">
                            <label>Subject<span class="text-danger">*</span></label>
                            <input class="form-control" ng-model="emailsubject" id="txtsubject" placeholder="Add a subject" />
                        </div>
                        <section class="simple-compose-box mb-xlg">
                            <textarea placeholder="Email message" ng-model="emailbody"
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
                                <ul class="compose-btn">
                                    <li>
                                        <button class="btn btn-info btn-xs" type="button" ng-click="emailUpdate()">Post</button>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="tab-pane " id="home3" role="tabpanel">
                    <div class="card"  style="padding:20px;">
                         <div class="row">
                                <div class="form-group col-sm-4">
                                    <label>Activity as</label><select class="form-control" id="txtactivity">
                                         <option>-- select --</option>
                                        <option>Log a Call</option>
                                        <option>Log an Email</option>
                                        <option>Log a Meeting</option>
                                    </select></div>
                                <div class="form-group col-sm-4">
                                    <label>Set Outcome</label><select class="form-control" id="txtoutcome">
                                        <option>-- select --</option>
                                        <option>Scheduled</option>
                                        <option>Rescheduled</option>
                                        <option>Closed</option>
                                    </select></div>
                             <div class="form-group col-sm-4">
                                    <label>Date</label><input type="date" class="form-control" id="txtdatetime"/></div>
                            </div>
                        <section class="simple-compose-box mb-xlg">
                           
                            <textarea placeholder="Describe the Activity"
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
                                <ul class="compose-btn">
                                    <li>
                                        <button class="btn btn-info btn-xs">Post</button>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="tab-pane" id="home5" role="tabpanel">
                    <div class="card" style="padding:20px;">
                         <div class="row">
                                <div class="form-group col-sm-8">
                                <label>Subject</label><input type="text" placeholder="Enter your Task" class="form-control" id="txttasksubject"/></div>
                             <div class="form-group col-sm-4">
                                    <label>Deadline</label><input type="date" class="form-control" id="txttaskdatetime"/></div>
                            </div>
                        <section class="simple-compose-box mb-xlg">
                            <textarea placeholder="Notes..."
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
                                         <option>-- select --</option>
                                    </select></div>
                             </div>
                         <section class="simple-compose-box mb-xlg">
                            <div class="compose-box-footer">
                                <ul class="compose-btn">
                                    <li>
                                        <button class="btn btn-info btn-xs">Post</button>
                                    </li>
                                </ul>
                            </div>
                        </section>
                            </div>
                </div>

            </div>

            <!-- The timeline -->
            <ul class="timeline timeline-inverse" id="historylist">
                    <!-- timeline item -->
                    <li  ng-repeat="x in datalist">
                        <i class="fa fa-envelope bg-blue"></i>
                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i>{{x.CreatedOn}}</span>

                            <h3 class="timeline-header">{{x.head}}</h3>

                            <div class="timeline-body">
                               {{x.body}}
                            </div>
                        </div>
                    </l>
               </ul>
            <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <div>
    </div>
</section>


