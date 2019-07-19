<%@ Control Language="C#" AutoEventWireup="true" CodeFile="emailTemplate.ascx.cs" Inherits="components_emailTemplate" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="row" >
<div class="col-md-12 mb-4">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">
                <i class="icon-calculator"></i>&nbsp;Template List</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#home2" role="tab" aria-controls="home2">
                <i class="icon-wrench"></i>&nbsp;New Template</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#home3" role="tab" aria-controls="home3">
                <i class="icon-calculator"></i>&nbsp;Delete Template</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="home1" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True" OnItemCommand="RadGrid1_ItemCommand" OnNeedDataSource="RadGrid1_NeedDataSource">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ExportSettings>
                                <Excel Format="Xlsx" />
                            </ExportSettings>
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                            </ClientSettings>
                            <MasterTableView CommandItemDisplay="Top" AutoGenerateColumns="True">
                                <CommandItemSettings ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowAddNewRecordButton="False" />
                                <Columns>
                                     <telerik:GridTemplateColumn SortExpression="id" UniqueName="TemplateColumn" HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button  CssClass="btn btn-success" ID="Button1" runat="server" CommandArgument='<%#Eval("id") %>' CommandName="View" Text="View" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
                <div class="card-footer">
                
                </div>
            </div>
        </div>
        <div class="tab-pane" id="home2" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                            <label class="col-md-3 control-label" for="inputRounded">Email Content</label>
                            <div class="col-md-12">
                                 <telerik:RadEditor ID="RadEditor1" runat="server" Skin="Bootstrap"  Height="800px"></telerik:RadEditor>
                              </div>
                          </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="inputRounded">Template Name</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-rounded" ></asp:TextBox>
                               </div>
                          </div>
                </div>
                <div class="card-footer">
                    <asp:Button ID="Button3" CssClass="btn btn-success" runat="server" Text="Save" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
        <div class="tab-pane" id="home3" role="tabpanel">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                            <label class="col-md-3 control-label" for="inputRounded">Template Name</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="TextBox2" CssClass="form-control input-rounded" placeholder="Enter ID" runat="server"></asp:TextBox>
                               </div>
                          </div>
                </div>
                <div class="card-footer">
                        <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text="Delete" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>

</div>

</div>
<asp:Literal ID="txtscript" runat="server"></asp:Literal>
