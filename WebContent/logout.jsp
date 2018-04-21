<%@ page 
		import ="controller.*"
		import = "model.*"
		language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<%
	String username = (String)session.getAttribute(Message.USERNAME); 
	String email = (String)session.getAttribute(Message.EMAIL);
	String community_name = (String)session.getAttribute(Message.COMMUNITY_NAME);
	
	if(username!=null){
		Session.Init(request.getSession());
		Session.clean();
		Session.removeMsg();
		User temp  = new User();
		temp.setUsername(username);
		temp.setEmail(email);
		temp.setCommunity_name(community_name);
		temp.setOnline(false);
		Database.setOnline(temp);
		CustomLog.log("logout",Message.LOG_INFO,email +" - " + Message.LOGGED_OUT);
	}

	response.sendRedirect("login.jsp");
%>