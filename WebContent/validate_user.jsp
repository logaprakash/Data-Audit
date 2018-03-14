<%@ page import ="controller.*" 
		 import ="model.*" 
		 %>
<%
	
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    User user = Database.validateUser(new User(email,password));
   
    	if(user != null) {
   			session.setAttribute(Message.MSG,Message.VALID_LOGIN);
   			session.setAttribute(Message.USERNAME,user.getUsername());
   			session.setAttribute(Message.EMAIL,user.getEmail());
   			response.sendRedirect("profile.jsp");
   			CustomLog.log("validate_user","info",user.getEmail()+" - " + Message.VALID_LOGIN);
   	 	}      
        else{
       		session.setAttribute(Message.MSG,Message.INVALID_LOGIN);
       		CustomLog.log("validate_user","info",email+ " - " +Message.INVALID_LOGIN);
       		response.sendRedirect("login.jsp"); 
        }   	 	
%>