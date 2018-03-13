<%@ page import ="controller.*"
		language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<%
	String username = (String)session.getAttribute(Message.USERNAME); 
	
	if(username!=null){
		session.removeAttribute(Message.MSG);
		session.removeAttribute(Message.USERNAME);
		session.removeAttribute(Message.EMAIL);
	}

	response.sendRedirect("login.jsp");
%>