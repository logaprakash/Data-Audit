<%@ page import = "model.*"
		 import = "controller.*" %>
<%
	String username = (String)session.getAttribute(Message.USERNAME); 
	String email = (String)session.getAttribute(Message.EMAIL);  
    String text = request.getParameter("status_input");
    Boolean result  = Database.addStatus(new Status(username,email,text));
   
    if(!result){
    	session.setAttribute(Message.MSG,Message.ALREADY_USER_EXIST);
    }
    
    response.sendRedirect("profile.jsp");
   
    
%>