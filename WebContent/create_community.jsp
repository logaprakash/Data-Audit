<%@page import ="controller.*"
		contentType="text/html" 
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Create community</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1,maximum-scale=1,minimum-scale=1">

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<body>

	<header>
		
		<nav class="navbar navbar-fixed-top">
			
			<div class="container">
				
				<div class="navbar-header">
					
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
					</button>

					<a class="navbar-brand custom-index-font" href="index.jsp">Mini-Media</a>
				</div>

				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
					<li><a href="create_community.jsp" class="custom-font"><span class="glyphicon glyphicon-user"></span> Create Community </a></li>
						<li><a href="join_community.jsp	" class="custom-font"><span class="glyphicon glyphicon-plus"></span> Join Community </a></li>
						<li><a href="login.jsp" class="custom-font"><span class="glyphicon glyphicon-log-in"></span> Login </a></li>
					</ul>				
				</div>

			</div>

		</nav><!--end nav-->

	</header><!--end header-->

	<div class="container"><!--start container-->	

		<div class="row"><!--start row-->

			<div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4"><!--start cols-->
				<div class="card card-1">
					<form method="post" action="register_community.jsp"><!--start form-->

						<h2 class="form-heading">Create a community</h2>
						<div class="form-group">
							<input type="text" name="community_name" placeholder="Community Name" class="form-control">
						</div>
						<div class="form-group">
							<input type="text" name="username" placeholder="Name" class="form-control">
						</div>

						<div class="form-group">
							<input type="email" name="email" placeholder="Email" class="form-control">
						</div>

						<div class="form-group">
							<input type="password" name="password" placeholder="Password" class="form-control">
						</div>
						
						<div class="form-group">
							<input type="password" name="confirm_password" placeholder="Confirm Password" class="form-control">
						</div>

						<input type="submit" name="submit" value="Submit" class="btn btn-primary">

						<!--<p>Already a user?<a href="login.jsp">Login</a></p>

					end form-->	
					</form>
				</div>	
			</div><!--end cols-->
		
		</div><!--end row-->		
	
	</div><!--end container-->
<center>
<h4 style="color:red;"><% 
	String username = (String)session.getAttribute(Message.USERNAME); 
	if(username!=null){
	  response.sendRedirect("profile.jsp");
	}
	String msg = (String)session.getAttribute(Message.MSG); 
	if(msg!=null){
	  out.print(msg);
	  session.removeAttribute(Message.MSG);
	}
%></h4>
</center>
	<footer class="footer navbar-fixed-bottom"><!--start footer-->
		
		<div class="container">

			<center>
				Copyright &copy; Data-Audit. All Rights Reserved
			</center>
		
		</div>		

	</footer><!--end footer-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>	
