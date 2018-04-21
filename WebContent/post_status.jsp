<%@ page import = "model.*"
		 import = "controller.*" %>
<%
	String username = (String)session.getAttribute(Message.USERNAME); 
	String email = (String)session.getAttribute(Message.EMAIL);  
    String text = request.getParameter("status_input");
    Session.Init(request.getSession());
    String community_name = String.valueOf(session.getAttribute(Message.COMMUNITY_NAME));
    Boolean result  = Database.addStatus(new Status(username,email,text,community_name));
   
    if(result){
    	CustomLog.log("post_status",Message.LOG_INFO,email +" - " + Message.ADDED_STATUS);
    }
    
    response.sendRedirect("profile.jsp");
   
    
%>