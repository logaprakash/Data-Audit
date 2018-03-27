<%@ page 
		import ="controller.*"
		language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<%
	
	
	Session.Init(request.getSession());
	Session.addCount();
	response.sendRedirect("profile.jsp");
%>