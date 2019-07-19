<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderDashboard.ascx.cs" Inherits="components_OrderDashboard" %>
 <div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="form-group col-sm-4">
                        <p class="h4 form-control-static">
                           EU Customers
                        </p>
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Coutries</label>
                        <p class="h4 form-control-static">
                           28
                        </p>
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Sales</label>
                        <p class="h4 form-control-static">
                            350,900.00 €
                        </p>
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
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="callout callout-info">
                                    <small class="text-muted">Sent Orders</small>
                                    <br>
                                    <strong class="h4">500</strong>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="callout callout-danger">
                                    <small class="text-muted">Total Orders</small>
                                    <br>
                                    <strong class="h4">120</strong>
                                </div>
                            </div>

                        </div>

                        <hr class="mt-0">
                        <div class="progress-group mb-4 card-header">
                            Top 10 Countries
                         </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=CountryDashboard&type=France" target="_blank">France</a></span>
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
                                <span class="progress-group-text"><a href="website.aspx?page=CountryDashboard&type=Germany" target="_blank">Germany</a></span>
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
                                <span class="progress-group-text"><a href="website.aspx?page=CountryDashboard&type=spain" target="_blank">Spain</a></span>
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
                                <span class="progress-group-text"><a href="website.aspx?page=CountryDashboard&type=luxemburg" target="_blank">Luxemburg</a></span>
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
                    </div>

                    <div class="col-sm-6">
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="callout callout-warning">
                                    <small class="text-muted">Support Tickets</small>
                                    <br>
                                    <strong class="h4">200</strong>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="callout callout-warning">
                                    <small class="text-muted">Pending Action</small>
                                    <br>
                                    <strong class="h4">120</strong>
                                </div>
                            </div>

                        </div>

                        <hr class="mt-0">
                        <div class="progress-group mb-4 card-header">
                            Top 10 Products Ordered Pending
                         </div>
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-user progress-group-icon"></i>
                                <div>Product A</div>
                                <div class="ml-auto font-weight-bold">599</div><div class="text-muted small">(100%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-user progress-group-icon"></i>
                                <div>Product B</div>
                                <div class="ml-auto font-weight-bold mr-2">256</div><div class="text-muted small">(70%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 91%" aria-valuenow="91" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-user-female progress-group-icon"></i>
                                <div>Product C</div>
                                <div class="ml-auto font-weight-bold mr-2">104</div><div class="text-muted small">(43%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 43%" aria-valuenow="43" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 91%" aria-valuenow="91" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-user-female progress-group-icon"></i>
                                <div>Product D</div>
                                <div class="ml-auto font-weight-bold mr-2">554</div><div class="text-muted small">(89%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 91%" aria-valuenow="91" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="progress-group mb-5">
                            <div class="progress-group-header">
                                <i class="icon-user-female progress-group-icon"></i>
                                <div>Product E</div>
                                <div class="ml-auto font-weight-bold mr-2">244</div><div class="text-muted small">(13%)</div>
                            </div>
                            <div class="progress-group-bars">
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 13%" aria-valuenow="13" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 91%" aria-valuenow="91" aria-valuemin="0" aria-valuemax="100"></div>
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
    <table class="table table-responsive-sm table-hover table-outline mb-0">
        <thead class="thead-light">
            <tr>
                <th class="text-center">Country</th>
                <th>Shipment</th>
                <th class="text-center"> Method</th>
                <th>Activity</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-center"><i class="flag-icon flag-icon-us h4 mb-0" id="us" title="us"></i></td>
                <td>
                    <div class="clearfix">
                        <div class="float-left"><strong>50%</strong></div>
                        <div class="float-right"><small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small></div>
                    </div>
                    <div class="progress progress-xs">
                        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar bg-success" role="progressbar" style="width: 50%"></div>
                    </div>
                </td>
                <td class="text-center"><i class="fa fa-plane" style="font-size: 24px"></i></td>
                <td>
                    <div class="small text-muted">Last Update</div>
                    <strong>10 sec ago</strong></td>
            </tr>
            <tr>
                <td class="text-center"><i class="flag-icon flag-icon-br h4 mb-0" id="br" title="br"></i></td>
                <td>
                    <div class="clearfix">
                        <div class="float-left"><strong>10%</strong></div>
                        <div class="float-right"><small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small></div>
                    </div>
                    <div class="progress progress-xs">
                        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="10" class="progress-bar bg-info" role="progressbar" style="width: 10%"></div>
                    </div>
                </td>
                <td class="text-center"><i class="fa fa-ship" style="font-size: 24px"></i></td>
                <td>
                    <div class="small text-muted">Last Update</div>
                    <strong>5 minutes ago</strong></td>
            </tr>
            <tr>
                <td class="text-center"><i class="flag-icon flag-icon-in h4 mb-0" id="in" title="in"></i></td>
                <td>
                    <div class="clearfix">
                        <div class="float-left"><strong>74%</strong></div>
                        <div class="float-right"><small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small></div>
                    </div>
                    <div class="progress progress-xs">
                        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="74" class="progress-bar bg-warning" role="progressbar" style="width: 74%"></div>
                    </div>
                </td>
                <td class="text-center"><i class="fa fa-plane" style="font-size: 24px"></i></td>
                <td>
                    <div class="small text-muted">Last Update</div>
                    <strong>1 hour ago</strong></td>
            </tr>
            <tr>
                <td class="text-center"><i class="flag-icon flag-icon-fr h4 mb-0" id="fr" title="fr"></i></td>
                <td>
                    <div class="clearfix">
                        <div class="float-left"><strong>98%</strong></div>
                        <div class="float-right"><small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small></div>
                    </div>
                    <div class="progress progress-xs">
                        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="98" class="progress-bar bg-danger" role="progressbar" style="width: 98%"></div>
                    </div>
                </td>
                <td class="text-center"><i class="fa fa-ship" style="font-size: 24px"></i></td>
                <td>
                    <div class="small text-muted">Last Update</div>
                    <strong>Last month</strong></td>
            </tr>
            <tr>
                <td class="text-center"><i class="flag-icon flag-icon-es h4 mb-0" id="es" title="es"></i></td>
                <td>
                    <div class="clearfix">
                        <div class="float-left"><strong>22%</strong></div>
                        <div class="float-right"><small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small></div>
                    </div>
                    <div class="progress progress-xs">
                        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="22" class="progress-bar bg-info" role="progressbar" style="width: 22%"></div>
                    </div>
                </td>
                <td class="text-center"><i class="fa fa-car" style="font-size: 24px"></i></td>
                <td>
                    <div class="small text-muted">Last Update</div>
                    <strong>Last week</strong></td>
            </tr>
            <tr>
                <td class="text-center"><i class="flag-icon flag-icon-pl h4 mb-0" id="pl" title="pl"></i></td>
                <td>
                    <div class="clearfix">
                        <div class="float-left"><strong>43%</strong></div>
                        <div class="float-right"><small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small></div>
                    </div>
                    <div class="progress progress-xs">
                        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="43" class="progress-bar bg-success" role="progressbar" style="width: 43%"></div>
                    </div>
                </td>
                <td class="text-center"><i class="fa fa-ship" style="font-size: 24px"></i></td>
                <td>
                    <div class="small text-muted">Last Update</div>
                    <strong>Yesterday</strong></td>
            </tr>
        </tbody>
    </table>
</div>