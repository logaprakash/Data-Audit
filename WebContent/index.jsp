<%@ page import ="controller.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>HomePage</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1,maximum-scale=1,minimum-scale=1">

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/custom_style.css">
</head>

<body>
<% 
	Session.Init(request.getSession());
	if(Session.isUserLogged()){
	  response.sendRedirect("profile.jsp");
	}
%>
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
						<li><a href="signup.jsp" class="custom-font"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li><a href="login.jsp" class="custom-font"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</ul>				
				</div>

			</div>
			
		</nav><!--end nav-->

	</header><!--end header-->
	<div class="container-fluid">
		
			<div class="row">
			
				<div class="col-sm-offset-4 col-md-offset-4 col-sm-4 col-md-4">
				
					<div class="custom-margin">
					
						<center>
						
							<img src="assets/logo.jpg" alt="logo">
							
						</center>
						
					</div>
					
				</div>
				<div class="col-sm-4 col-md-4"></div>
			</div>
				
	</div>
	
	<footer class="footer navbar-fixed-bottom"><!--start footer-->

		<div class="align-center">
			Copyright &copy; Data-Audit. All Rights Reserved
		</div>	

	</footer><!--end footer-->


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
