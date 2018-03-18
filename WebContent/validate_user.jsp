<%@ page import ="controller.*" 
		 import ="model.*" 
		 %>
<%
	
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    User user = Database.validateUser(new User(email,password));
    Session.Init(request.getSession());
   
    	if(user != null) {
			Session.generateSession(user);
			Session.addMsg(Message.VALID_LOGIN);
   			response.sendRedirect("profile.jsp");
   			CustomLog.log("validate_user",Message.LOG_INFO,user.getEmail()+" - " + Message.VALID_LOGIN);
   	 	}      
        else{
       		Session.addMsg(Message.INVALID_LOGIN);
       		CustomLog.log("validate_user",Message.LOG_INFO,email+ " - " +Message.INVALID_LOGIN);
       		response.sendRedirect("login.jsp"); 
        }   	 	
%>