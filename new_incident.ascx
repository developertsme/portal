<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_incident.ascx.cs" Inherits="new_incident" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<div class="atsbody">
    <main class="atsmain" style="width:100%">

        <input id="tab1" type="radio" class="atsinput" name="tabs" checked>
        <label for="tab1">Incident Report</label>

        <input id="tab2" type="radio" class="atsinput" name="tabs">
        <label for="tab2">Investigation Report</label>

        <input id="tab4" type="radio" class="atsinput" name="tabs">
        <label for="tab4">Files</label>

        <section id="content1" class="atssection">
            <div class="masonry-item col-md-12" >
                <div class="bgc-white p-20 bd">
                    <div class="mT-30">
                            <div class="form-group">
                                <label>Item Name</label>
                               <asp:TextBox ID="txtname" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
                                <div class="form-group">
                                    <label>Incident Report</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
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

        <section id="content2" class="atssection">
            <div class="masonry-item col-md-12" >
                <div class="bgc-white p-20 bd">
                    <div class="row">
                    <div class="col-md-6">
                           <div class="form-group">
                                    <label>Investigation Details</label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                           </div>
                        <div class="form-group">
                                    <label>Recommendation</label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                           </div>
                        <div class="form-group">
                                    <label>Final Outcome</label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                           </div>
                        <div class="form-group">
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Save" />
                            </div>
                    </div>
                    <div class="col-md-6">
                                <div class="mT-30">
                                    <div class="timeline">
		                    <ul>
			                    <li>
				                    <div class="content">
					                    <h3 id="heading1" class="timelineh3">Heading 1</h3>
					                    <p>This is paragraph 1. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
				                    </div>
			                    </li>
			                    <li>
				                    <div class="content">
					                    <h3 id="heading2" class="timelineh3">Heading 2</h3>
					                    <p>This is paragraph 2. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</p>
				                    </div>
			                    </li>
			                    <li>
				                    <div class="content">
					                    <h3 id="heading3" class="timelineh3">Heading 3</h3>
					                    <p>This is paragraph 3. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. </p>
				                    </div>
			                    </li>
			
			                    <div style="clear:both;"></div>
		                    </ul>
	                    </div>
                                </div>
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


