<%@ page import ="controller.*"
		 import ="model.*"
		 import ="java.util.ArrayList" %>
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

<body style="background:#e6ecf0;color:#3c465a;margin-top:110px;">

	<header><!--start header-->
		
		<nav class="navbar navbar-fixed-top" style="background:#3c465a;"><!--start nav-->
			
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
						<li><a href="create_community.jsp"><span class="glyphicon glyphicon-user"></span> Create Community </a></li>
						<li><a href="join_community.jsp	"><span class="glyphicon glyphicon-plus"></span> Join Community </a></li>
						<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login </a></li>
					</ul>				
				</div>

			</div>

		</nav><!--end nav-->

	</header><!--end header-->


	<div class="container"><!--start container-->	

		<div class="row"><!--start row-->

			<div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4"><!--start cols-->

				
					
					<div class="card card-1" style="padding:5%;">
						<h2 style="padding-bottom:5%;">Login</h2>


						<form method="post" action="validate_user.jsp"><!--start form-->

							<div class="form-group">
								<input type="email" name="email" placeholder="Email" class="form-control">
							</div>

							<div class="form-group">
								<input type="password" name="password" placeholder="Password" class="form-control">
							</div>	
							
							<div class="form-group">
					
								<select id = "community" name="community" class="dropdown-custom">
								<%
									ArrayList<Community> list = Database.getAllCommunity(request.getSession());
									for(Community temp:list){%>
              						<option value ="<%out.print(temp.getName()); %>" style="color: black;"><%=temp.getName() %></option>
              						<%} %>
              				
             					</select>
								
							</div>
							<div class="form-group">	
								<input type="submit" name="submit" value="Submit" class="request-btn">
							</div>
						</form><!--end form-->	
					
					

					
						<p>Join a community?<a href="join_community.jsp">Join Community</a></p>
						<p>Create a community?<a href="create_community.jsp">Create Community</a></p>
				</div>
			
			
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

	

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>	
