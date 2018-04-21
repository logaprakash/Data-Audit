<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="controller.*"
    import="model.*"
    %>
<%
	String accept  = (String) request.getParameter("accept");
	String reject  = (String) request.getParameter("reject");
	String email  = (String) request.getParameter("email");
	String community_name  = (String) request.getParameter("community_name");
	User temp = new User();
	temp.setCommunity_name(community_name);
	temp.setEmail(email);
	if(accept!=null){
		temp.setApproved(true);
		Database.setApproved(temp);
	}
	response.sendRedirect("profile.jsp");
%>