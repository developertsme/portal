<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html class="fixed" lang="en">
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="keywords" content="" />
		<meta name="description" content="">
		<meta name="author" content="Aresh">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <title>Welcome - Tsume Art Portal</title>

        <link rel="stylesheet" type="text/css" href="css/login/util.css">
      <link rel="stylesheet" type="text/css" href="css/login/main.css">
  </head>

  <body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <!-- start: page -->
		
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
                <asp:Literal ID="txterror" runat="server"></asp:Literal>
                <div class="login100-form validate-form">
                    
					<span class="login100-form-title p-b-43">
                        <img src="/images/tsume.png" width="30%" /><br />
						Login to Tsume Portal
					</span>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<asp:TextBox ID="loginemail" CssClass="input100" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="label-input100">Email</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
                        <asp:TextBox ID="loginpassword" CssClass="input100" runat="server" TextMode="Password"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						

						<div>
							<a href="/password.aspx" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
                        <asp:Button ID="Button1" CssClass="login100-form-btn" runat="server" Text="Login" OnClick="Button1_Click" />
					</div>
					
					</div>

				<div class="login100-more" style="background-image: url('images/bg-01.png');">
				</div>
			</div>
		</div>
	</div>
	
		<!-- end: page -->

    </form>
  </body>
</html>



 

												

							    