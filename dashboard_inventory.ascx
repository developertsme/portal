<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dashboard_inventory.ascx.cs" Inherits="components_dashboard_inventory" %>

<div class="row gap-20 masonry pos-r">
            <div class="masonry-sizer col-md-6"></div>
            <div class="masonry-item col-12">
              <div class="bd bgc-white">
                <div class="peers fxw-nw@lg+ ai-s">
                  <div class="peer" style="width:100% !important;">
                    <div class="layers">
                      <div class="layer w-100">
                        <div class="peers pT-20 mT-20 bdT fxw-nw@lg+ jc-sb ta-c gap-10">
                          <div class="peer">
                            <div class="easy-pie-chart" data-size="80" data-percent="75" data-bar-color="#f44336"><span></span></div>
                            <h6 class="fsz-sm">Qty in Hand</h6>
                          </div>
                          <div class="peer">
                            <div class="easy-pie-chart" data-size="80" data-percent="90" data-bar-color="#ff9800"><span></span></div>
                            <h6 class="fsz-sm">Qty in Stock</h6>
                          </div>
                          <div class="peer">
                            <div class="easy-pie-chart" data-size="80" data-percent="55" data-bar-color="#4caf50"><span></span></div>
                            <h6 class="fsz-sm">Qty Allocated</h6>
                          </div>
                          <div class="peer">
                            <div class="easy-pie-chart" data-size="80" data-percent="20" data-bar-color="#673ab7"><span></span></div>
                            <h6 class="fsz-sm">Qty in Transit</h6>
                          </div>
                          <div class="peer">
                            <div class="easy-pie-chart" data-size="80" data-percent="42" data-bar-color="#2196f3"><span></span></div>
                            <h6 class="fsz-sm">Qty to be Recieved</h6>
                          </div>
                          <div class="peer">
                            <div class="easy-pie-chart" data-size="80" data-percent="90" data-bar-color="#ff9800"><span></span></div>
                            <h6 class="fsz-sm">Qty on Hold</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>