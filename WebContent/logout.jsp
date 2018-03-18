<%@ page 
		import ="controller.*"
		language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<%
	String username = (String)session.getAttribute(Message.USERNAME); 
	String email = (String)session.getAttribute(Message.EMAIL);
	
	if(username!=null){
		session.removeAttribute(Message.MSG);
		session.removeAttribute(Message.USERNAME);
		session.removeAttribute(Message.EMAIL);
		Database.putOffline(email);
		CustomLog.log("logout",Message.LOG_INFO,email +" - " + Message.LOGGED_OUT);
	}

	response.sendRedirect("login.jsp");
%>