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
   			}
        	else{  
   				session.setAttribute(Message.MSG,Message.ALREADY_USER_EXIST);
   				response.sendRedirect("create_community.jsp");   
   			}    
    	 	
    	}
    else{
    	session.setAttribute(Message.MSG,Message.PASSWORD_MISMATCH);
		response.sendRedirect("signup.jsp");
    }
    
%>