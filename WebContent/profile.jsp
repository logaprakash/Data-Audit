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

		<div class="col-md-3">
			<div class="profile-outer">
				<div class="profile-inner">
						<img style="border-radius:50%;height:100px;weight:100px;" src="assets/profile.png"/>	
						<h2 style="color:black;">Welcome, <%= session.getAttribute( Message.USERNAME ) %></h2>
						<h4 style="color:black;">Community: <%= session.getAttribute( Message.COMMUNITY_NAME ) %></h4>
						<h6 style="color:black;">Email: <%= session.getAttribute( Message.EMAIL ) %></h6>
				</div>
			</div>
			
			<div>
				<div class="form-outer">
					<div class="form-inner">
						<form class="form-status" action="post_status.jsp" method="post">				
							<Textarea name="status_input" class="form-status-textbox" cols="5" rows="5" placeholder="Enter somthing here ..."></Textarea>
							<input name="status_btn" class="form-status-btn" type="submit" value="Post"/>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div style="padding-top:10%;padding-bottom:15%;background:#3c465a;overflow-y: auto;height:560px;">
					<% 
						//int count = 0;
					   	ArrayList<Status> feed = Database.getAllStatus(String.valueOf(Session.getCommunity_name()));
					   for(Status temp:feed){ 
					   //if(count==4)
							//break;
					   //else
							//count++;%>
				<div class="form-outer">
					<div class="form-inner">
						<h4>
							<%out.print(temp.getText());%>
						</h4>
						<h6>
							Posted by <%out.print(temp.getUsername());%> at <%out.print(temp.getDateTime());%>
						</h6>
					</div>
				</div>
			<br><%}%>
			<!-- <div style="padding:5%;">
				<form method="post" action="load_more.jsp">
					<input name="load_more_btn" style="width:100%;background:white;color:black;" type="submit" value="Load more"/>
				</form>
			</div> -->
			</div>	
			
		</div>
		<div class="col-md-3">
				<div>
					<div class="member-title"><h4 style="padding:2%;">Members</h4></div>
					<div class="member-outer">
					
						<%
						
						ArrayList<User> members = Database.getAllOnline(Session.getSessionUser());
						   for(User temp : members){%>
						   
						   <%
							   if(temp.isOnline()){
						%>
						<div class="member-inner">
						   <b style="color:green;"><%=temp.getUsername()+" - Online"%></b>
						</div>
							<%
							}else if(temp.isApproved()){
								%>
						<div class="member-inner">
							<b style="color:red;"><%=temp.getUsername()+" - Offline"%></b>
						</div>
							<%}%>
						
						
						<%}%>
					
					
					</div>
					<br>
					<center>
					<form class="form-status">
						<a href="profile.jsp"><input type="submit" name="refresh" value="Refresh" class="btn btn-primary"></a>
					</form>
					</center>
				</div>
				
				<%
					if(Session.getRole().equals(Message.ROLE_ADMIN)){
				%>
				<div>
				<div class="request-title"><h4 style="padding:2%;">Request</h4></div>
					<div class="request-outer">
					
					
					<% 
					   	ArrayList<User> users = Database.getAllRequestInCommunity(Session.getCommunity_name());
					   for(User temp:users){ 
					 %>
	
					<div class="request-inner">
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
					
				
				
			<%}%>
					
					
				</div>
					
			</div>
			<%} %>
				
		</div>
	<!--  -->footer class="footer navbar-fixed-bottom"><!--start footer-->

		<div class="align-center">
			Copyright &copy; Data-Audit. All Rights Reserved
		</div>	

	</footer><!--end footer-->


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
