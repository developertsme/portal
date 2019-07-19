<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_commissioning.ascx.cs" Inherits="components_new_commissioning" %>

<div class="md-stepper-horizontal orange">
    <div class="md-step active done" style="width: 20% !important;">
      <div class="md-step-circle"><span>1</span></div>
      <div class="md-step-title">Category</div>
      <div class="md-step-bar-left"></div>
      <div class="md-step-bar-right"></div>
    </div>
    <div class="md-step active editable" style="width: 30% !important;">
      <div class="md-step-circle"><span>2</span></div>
      <div class="md-step-title">Product Assembly</div>
      <div class="md-step-bar-left"></div>
      <div class="md-step-bar-right"></div>
    </div>
    <div class="md-step active">
      <div class="md-step-circle"><span>3</span></div>
      <div class="md-step-title">Bill of Materials/Parts</div>
      <div class="md-step-bar-left"></div>
      <div class="md-step-bar-right"></div>
    </div>
  </div>


<div class="full-container1">
    <div class="email-app">
        <div class="email-side-nav remain-height ov-h">
            <div class="h-100 layers">
                <div class="p-20 bgc-grey-100 layer w-100"><a href="/compose" class="btn btn-danger btn-block">New Category</a></div>
                <div class="scrollable pos-r bdT layer w-100 fxg-1">
                    <ul class="p-20 nav flex-column">
                        <li class="nav-item"><a href="javascript:void(0)" class="nav-link c-grey-800 cH-blue-500 active">
                            <div class="peers ai-c jc-sb">
                                <div class="peer peer-greed"><i class="mR-10 ti-star"></i><span>Tsume HQS</span></div>
                                <div class="peer"><span class="badge badge-pill bgc-deep-purple-50 c-deep-purple-700">+99</span></div>
                            </div>
                        </a></li>
                        <li class="nav-item"><a href="javascript:void(0)" class="nav-link c-grey-800 cH-blue-500 active">
                            <div class="peers ai-c jc-sb">
                                <div class="peer peer-greed"><i class="mR-10 ti-star"></i><span>Tsume Apparel</span></div>
                                <div class="peer"><span class="badge badge-pill bgc-deep-purple-50 c-deep-purple-700">+35</span></div>
                            </div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="email-wrapper row remain-height bgc-white ov-h">
            <div class="email-list h-100 layers">
                <div class="layer w-100">
                    <div class="bgc-grey-100 peers ai-c jc-sb p-20 fxw-nw">
                        <div class="peer">
                        <div class="btn-group" role="group"><button type="button" class="email-side-toggle peers fxw-nw p-20 bdB cur-p d-n@md+"><i class="ti-angle-left"></i></button></div>
                      </div>
                      <div class="peer">
                        <h6 class="c-grey-900" style="padding-top:6px">New Product Line</h6>
                      </div>
                        <div class="peer">
                        <div class="btn-group" role="group"> <button type="button" class="email-list-item peers fxw-nw p-20 bdB cur-p d-n@md+"><i class="ti-angle-right"></i></button></div>
                      </div>
                    </div>
                </div>
                <div class="layer w-100 fxg-1 scrollable pos-r">
                    <div class="">
                        <div class="">
                            <div class="peer peer-greed ov-h">
                                <div class="peers ai-c">
                                    <div class="peer peer-greed">
                                        <h6>Product Name</h6>
                                    </div>
                                </div>
                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtname" ValidationGroup="form" runat="server" ErrorMessage="Product Name Required"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="">
                            <div class="peer peer-greed ov-h">
                                <div class="peers ai-c">
                                    <div class="peer peer-greed">
                                        <h6>Product Qty</h6>
                                    </div>
                                </div>
                                <asp:TextBox ID="txtqty" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                <asp:RegularExpressionValidator ValidationGroup="form" ID="RegularExpressionValidator1" ControlToValidate="txtqty" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="">
                            <div class="peer peer-greed ov-h">
                                <div class="peers ai-c">
                                    <div class="peer peer-greed">
                                        <h6>Product Number of Parts</h6>
                                    </div>
                                </div>
                                <asp:TextBox ID="txtqtyparts" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                <asp:RegularExpressionValidator ValidationGroup="form" ID="RegularExpressionValidator2" ControlToValidate="txtqtyparts" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="">
                            <div class="peer peer-greed ov-h">
                                <asp:Button ID="btnsubmit" ValidationGroup="form" CssClass="btn btn-primary" runat="server" Text="Submit" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="email-content h-100">
                <div class="h-100 scrollable pos-r">
                    <div class="bgc-grey-100 peers ai-c jc-sb p-20 fxw-nw d-n@md+">
                      <div class="peer">
                        <div class="btn-group" role="group"> <button type="button" class="email-list-item peers fxw-nw p-20 bdB cur-p d-n@md+"><i class="ti-angle-left"></i></button></div>
                      </div>
                    </div>
                    <div class="bgc-white p-20 bd">
                        <h6 class="c-grey-900">New Part Part</h6>
                        <div class="mT-30">
                            <div class="">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Part Name</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Part Qty</label>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                    <label for="inputAddress">Location/Country</label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                    <div class="form-group col-md-6">
                                        <label class="fw-500">Date Ready</label><div class="timepicker-input input-icon form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon bgc-white bd bdwR-0"><i class="ti-calendar"></i></div>
                                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bgc-grey-300">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Part Name</label>
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Part Qty</label>
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                    <label for="inputAddress">Location/Country</label>
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                    <div class="form-group col-md-6">
                                        <label class="fw-500">Date Ready</label><div class="timepicker-input input-icon form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon bgc-white bd bdwR-0"><i class="ti-calendar"></i></div>
                                                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Part Name</label>
                                        <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Part Qty</label>
                                        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                    <label for="inputAddress">Location/Country</label>
                                    <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                    <div class="form-group col-md-6">
                                        <label class="fw-500">Date Ready</label><div class="timepicker-input input-icon form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon bgc-white bd bdwR-0"><i class="ti-calendar"></i></div>
                                               <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
