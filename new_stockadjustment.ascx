<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_stockadjustment.ascx.cs" Inherits="components_new_stockadjustment" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<div class="atsbody">
    <main class="atsmain" style="width:100%">

        <input id="tab1" type="radio" class="atsinput" name="tabs" checked>
        <label for="tab1">Stock Adjustment</label>

        <input id="tab4" type="radio" class="atsinput" name="tabs">
        <label for="tab4">Files</label>

        <section id="content1" class="atssection">
            <div class="masonry-item col-md-12" >
                <div class="bgc-white p-20 bd">
                    <div class="mT-30">
                            <div class="form-group">
                                <label>Item / Product / SKU</label>
                               <asp:TextBox ID="txtname" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                <div class="form-group">
                                    <label>Total In Stock</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                </div>
                            <div class="form-group">
                                <label>Add/Remove Stock</label>
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                     <asp:ListItem Value="">--Please Select--</asp:ListItem>
                                    <asp:ListItem Value="ADD" Text="Add Stock"></asp:ListItem>
                                    <asp:ListItem Value="REMOVE" Text="Remove Stock"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                <div class="form-group">
                                    <label>Quantity Added/Removed</label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Total In Stock After Adjustment</label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Reason</label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                </div>
                            <div class="form-group">
                                    <label>Notes</label>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                </div>
                            
                            <div class="form-group">
                                <label>Status</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Save" />
                            </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="content4" class="atssection">
            <div class="masonry-item col-md-12" >
                <div class="bgc-white p-20 bd">
                    <div class="mT-30">
                            <div class="form-group">
                                <label for="inputAddress">Images</label>
                                <div class="clear"></div>
                                <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" CssClass="form-control">
                                </telerik:RadAsyncUpload>
                            </div>
                        <div class="form-group">
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Save" />
                            </div>
                    </div>
                </div>
            </div>
        </section>

    </main>

</div>


