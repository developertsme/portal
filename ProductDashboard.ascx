<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductDashboard.ascx.cs" Inherits="components_ProductDashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="row">
    <div class="col-md-12 mb-4">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="form-group col-sm-4">
                        <p class="h4 form-control-static">
                            Product A
                        </p>
                    </div>
                    <div class="form-group col-sm-4">
                        <p class="h4 form-control-static">
                            SKU 123
                        </p>
                    </div>
                    <div class="form-group col-sm-4">
                        <p class="h4 form-control-static">
                            350.00 €
                        </p>
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
