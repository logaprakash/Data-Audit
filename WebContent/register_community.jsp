<%@ page import ="model.*"
		 import = "controller.*" %>
<%
	String community = request.getParameter("community_name");
    String username = request.getParameter("username");  
    String email = request.getParameter("email");  
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    
    if(confirmPassword.equals(password)){
    	 	
    	Boolean result = Database.registerUser(new User(username,email,password,community,Message.ROLE_ADMIN,true));
        
    	 	if(result){
    	 		result = Database.registerCommunity(new Community(community,username,email));
        		response.sendRedirect("login.jsp");
        		CustomLog.log("validate_user",Message.LOG_INFO,email+" at " +community +" - "+Message.COMMUNITY_CREATED);
   			}
        	else{  
   				session.setAttribute(Message.MSG,Message.ALREADY_USER_EXIST);
   				response.sendRedirect("create_community.jsp");  
   				CustomLog.log("validate_user",Message.LOG_WARN,email+" at " + community+" - "+Message.ALREADY_USER_EXIST);
   			}    
    	 	
    	}
    else{
    	session.setAttribute(Message.MSG,Message.PASSWORD_MISMATCH);
		response.sendRedirect("signup.jsp");
    }
    
%>