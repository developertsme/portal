<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dashboard.ascx.cs" Inherits="components_dashboard" %>
<div class="row"  ng-controller="maindashboard">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">Traffic &amp; Sales</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="callout callout-info">
                                    <small class="text-muted">Total</small>
                                    <br>
                                    <strong class="h4">33 998,60</strong>€
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="callout callout-danger">
                                    <small class="text-muted">DLC</small>
                                    <br>
                                    <strong class="h4">22,643</strong>€
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="callout callout-info">
                                    <small class="text-muted">EU Customer</small>
                                    <br>
                                    <strong class="h4">9,123</strong>€
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="callout callout-danger">
                                    <small class="text-muted">EU PRO</small>
                                    <br>
                                    <strong class="h4">22,643</strong>€
                                </div>
                            </div>

                        </div>

                        <hr class="mt-0">
                        <div class="progress-group mb-4 card-header">
                            Sent Orders vs Pending Orders
                         </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=EU" target="_blank">EU Customer</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 34%" aria-valuenow="34" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                        </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=EUPRO" target="_blank">EU PRO</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 56%" aria-valuenow="56" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 94%" aria-valuenow="94" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=US" target="_blank">US Customer</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=USPRO" target="_blank">US PRO</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 43%" aria-valuenow="43" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 91%" aria-valuenow="91" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=DLC" target="_blank">DLC</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 73%" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=OOE" target="_blank">OOE Customer</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 53%" aria-valuenow="53" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 82%" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=OrderDashboard&type=OOEPRO" target="_blank">OOE PRO</a></span>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 9%" aria-valuenow="9" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 69%" aria-valuenow="69" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="callout callout-warning">
                                    <small class="text-muted">US Customer</small>
                                    <br>
                                    <strong class="h4">5 78,623</strong>€
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="callout callout-success">
                                    <small class="text-muted">US PRO</small>
                                    <br>
                                    <strong class="h4">9 9,123</strong>€
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="callout callout-warning">
                                    <small class="text-muted">OOE Customer</small>
                                    <br>
                                    <strong class="h4">11 78,623</strong>€
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="callout callout-success">
                                    <small class="text-muted">OOE PRO</small>
                                    <br>
                                    <strong class="h4">7 745,22</strong>€
                                </div>
                            </div>

                        </div>

                        <hr class="mt-0">
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-basket progress-group-icon"></i>
                                <div>Ordered</div>
                                <div class="ml-auto font-weight-bold">599</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-user progress-group-icon"></i>
                                <div>Sent</div>
                                <div class="ml-auto font-weight-bold mr-2">256</div><div class="text-muted small">(70%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group mb-5">
                            <div class="progress-group-header">
                                <i class="icon-user-female progress-group-icon"></i>
                                <div>Not Sent</div>
                                <div class="ml-auto font-weight-bold mr-2">244</div><div class="text-muted small">(43%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 43%" aria-valuenow="43" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>


                        <div class="progress-group">
                            <div class="progress-group-header align-items-end">
                                <i class="icon-globe progress-group-icon"></i>
                                <div>Ticket Category A</div>
                                <div class="ml-auto font-weight-bold mr-2">191.235</div>
                                <div class="text-muted small">(56%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 56%" aria-valuenow="56" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header align-items-end">
                                <i class="icon-social-facebook progress-group-icon"></i>
                                <div>Ticket Category B</div>
                                <div class="ml-auto font-weight-bold mr-2">51.223</div>
                                <div class="text-muted small">(15%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header align-items-end">
                                <i class="icon-social-twitter progress-group-icon"></i>
                                <div>Ticket Category C</div>
                                <div class="ml-auto font-weight-bold mr-2">37.564</div>
                                <div class="text-muted small">(11%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 11%" aria-valuenow="11" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header align-items-end">
                                <i class="icon-social-linkedin progress-group-icon"></i>
                                <div>Ticket Category D</div>
                                <div class="ml-auto font-weight-bold mr-2">27.319</div>
                                <div class="text-muted small">(8%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 8%" aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">Traffic &amp; Sales</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                    <table class="table table-responsive-sm table-hover table-outline mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>User</th>
                                <th class="text-center">Country</th>
                                <th>Usage</th>
                                <th class="text-center">Payment Method</th>
                                <th>Activity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div>Yiorgos Avraamu</div>
                                    <div class="small text-muted">
                                        <span>New</span> | Registered: Jan 1, 2015
                                    </div>
                                </td>
                                <td class="text-center">
                                    <i class="flag-icon flag-icon-us h4 mb-0" id="us" title="us"></i>
                                </td>
                                <td>
                                    <div class="clearfix">
                                        <div class="float-left">
                                            <strong>50%</strong>
                                        </div>
                                        <div class="float-right">
                                            <small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small>
                                        </div>
                                    </div>
                                    <div class="progress progress-xs">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <i class="fa fa-cc-mastercard" style="font-size: 24px"></i>
                                </td>
                                <td>
                                    <div class="small text-muted">Last login</div>
                                    <strong>10 sec ago</strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <div class="col-md-6">
                    <table class="table table-responsive-sm table-hover table-outline mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>User</th>
                                <th class="text-center">Country</th>
                                <th>Usage</th>
                                <th class="text-center">Payment Method</th>
                                <th>Activity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div>Avram Tarasios</div>
                                    <div class="small text-muted">
                                        <span>Recurring</span> | Registered: Jan 1, 2015
                                    </div>
                                </td>
                                <td class="text-center">
                                    <i class="flag-icon flag-icon-br h4 mb-0" id="br" title="br"></i>
                                </td>
                                <td>
                                    <div class="clearfix">
                                        <div class="float-left">
                                            <strong>10%</strong>
                                        </div>
                                        <div class="float-right">
                                            <small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small>
                                        </div>
                                    </div>
                                    <div class="progress progress-xs">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <i class="fa fa-cc-visa" style="font-size: 24px"></i>
                                </td>
                                <td>
                                    <div class="small text-muted">Last login</div>
                                    <strong>5 minutes ago</strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


