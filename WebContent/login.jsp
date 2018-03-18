<%@ page import ="controller.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1,maximum-scale=1,minimum-scale=1">

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/custom_style.css">

</head>

<body>

	<header><!--start header-->
		
		<nav class="navbar navbar-inverse navbar-fixed-top"><!--start nav-->
			
			<div class="container">
				
				<div class="navbar-header">
					
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="index.jsp">Mini-Media</a>
				</div>

				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</ul>				
				</div>

			</div>

		</nav><!--end nav-->

	</header><!--end header-->


	<div class="container"><!--start container-->	

		<div class="row"><!--start row-->

			<div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4"><!--start cols-->

				<div class="panel panel-primary"><!--start panel-->
					
					<div class="panel-heading">
						<h3>Login Form</h3>
					</div>
					<div class="panel-body">

						<p class="text-warning">Login to your account</p>

						<form method="post" action="validate_user.jsp"><!--start form-->

							<div class="form-group">
								<input type="email" name="email" placeholder="Email" class="form-control">
							</div>

							<div class="form-group">
								<input type="password" name="password" placeholder="Password" class="form-control">
							</div>		
							<input type="submit" name="submit" value="Submit" class="btn btn-primary">

						</form><!--end form-->	
					
					</div>

					<div class="panel-footer">
						<p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
					</div>

				</div><!--end panel-->
			
			</div><!--end cols-->
		
		</div><!--end row-->		
	
	</div><!--end container-->
<div class="align-center">
<h4 style="color:red;">
<% 
	Session.Init(request.getSession());
	if(Session.isUserLogged()){
	  response.sendRedirect("profile.jsp");
	}
	String temp = Session.getMsg();
	if(!temp.equals("")){
	  out.print(temp);
	  Session.removeMsg();
	}
%>
</h4></div>

	<footer class="footer navbar-fixed-bottom"><!--start footer-->
		
		<div class="container">

			<div class="align-center">
				Copyright &copy; Data-Audit. All Rights Reserved
			</div>
		
		</div>		

	</footer><!--end footer-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>	
