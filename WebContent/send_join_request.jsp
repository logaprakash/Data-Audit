<%@ page import ="model.*"
		 import = "controller.*" %>
<%
	String community = request.getParameter("community_name");
    String username = request.getParameter("username");  
    String email = request.getParameter("email");  
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    
    if(confirmPassword.equals(password)){
    	 	
    	Boolean result = Database.registerUser(new User(username,email,password,community,Message.ROLE_MEMBER,false));
        
    	 	if(result){
        		response.sendRedirect("login.jsp");
        		CustomLog.log("validate_user",Message.LOG_INFO,email+" at " +community +" - "+Message.COMMUNITY_REQUESTED);
   			}
        	else{  
   				session.setAttribute(Message.MSG,Message.ALREADY_USER_EXIST);
   				response.sendRedirect("join_community.jsp");  
   				CustomLog.log("validate_user",Message.LOG_WARN,email+" at " + community+" - "+Message.ALREADY_USER_EXIST);
   			}    
    	 	
    	}
    else{
    	session.setAttribute(Message.MSG,Message.PASSWORD_MISMATCH);
		response.sendRedirect("join_community.jsp");
    }
    
%>