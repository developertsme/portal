<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CountryDashboard.ascx.cs" Inherits="components_CountryDashboard" %>
<div class="row">
    <div class="col-md-12">

        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-3">
                        <i class="flag-icon flag-icon-fr h1 mb-0" id="EA" title="EA"></i>
                    </div>
                    <div class="form-group col-sm-5">
                        <p class="h4 form-control-static">EU Customers</p>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <p class="h4 form-control-static">
                            France
                        </p>
                    </div>
                </div>
                </div>
            </div>
            
        </div>

    </div>
<div class="row" >
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
                            Top 10 Active Product Orders
                         </div>
                        <div class="progress-group mb-4">
                            <div class="progress-group-prepend">
                                <span class="progress-group-text"><a href="website.aspx?page=ProductDashboard&type=A" target="_blank">Product A</a></span>
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
                                <span class="progress-group-text"><a href="website.aspx?page=ProductDashboard&type=B" target="_blank">Product B</a></span>
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
                                <span class="progress-group-text"><a href="website.aspx?page=ProductDashboard&type=D" target="_blank">Product D</a></span>
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
                                <span class="progress-group-text"><a href="website.aspx?page=ProductDashboard&type=E" target="_blank">Product E</a></span>
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
                           Support Tickets
                         </div>
                        <div class="progress-group">
                            <div class="progress-group-header">
                                <i class="icon-user progress-group-icon"></i>
                                <div>Support Category A</div>
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
                                <div>Support Category B</div>
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
                                <div>Support Category C</div>
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
                                <div>Support Category D</div>
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
                                <div>Support Category E</div>
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