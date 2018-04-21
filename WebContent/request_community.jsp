<%@ page import ="controller.*"
		 import ="model.*"
		 import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<title><% Session.Init(request.getSession());
			  out.print(Session.getUsername()); %></title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1,maximum-scale=1,minimum-scale=1">

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/custom_style.css">
</head>

<body>
<% 
	if(!Session.isUserLogged()){
	  response.sendRedirect("login.jsp");
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
						<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
					</ul>				
				</div>

			</div>
			
		</nav><!--end nav-->

	</header><!--end header-->

		
		<div class="col-md-4">
			<div style="padding-top:10%;padding-bottom:15%;background:#3c465a;overflow-y: auto;height:560px;">
					<% 
					   	ArrayList<User> users = Database.getAllRequestInCommunity(Session.getCommunity_name());
					   for(User temp:users){ 
					 %>
				<div class="form-outer">
					<div class="form-inner">
						<h4>
							<%out.print(temp.getUsername());%>
						</h4>
						<h6>
							 Requested from <%out.print(temp.getEmail());%> to join at <%out.print(temp.getCommunity_name());%> Community
						</h6>
						<form action="request_control.jsp" method="POST">
						<input type="hidden" value=<%=temp.getEmail()%> name="email" />
						<input type="hidden" value=<%=temp.getCommunity_name()%> name="community_name" />
						<input type="submit" name="accept" value="Accept" class="btn btn-primary">
						<input type="submit" name="reject" value="reject" class="btn btn-primary">
					</form>
					</div>
					
				</div>
				
			<br><%}%>
		
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
