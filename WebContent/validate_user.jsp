<%@ page import ="controller.*" 
		 import ="model.*" 
		 import ="org.apache.log4j.Logger" %>
<%
	final Logger logger = Logger.getLogger("validate_user.jsp");
	
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    User user = Database.validateUser(new User(email,password));
   
    	if(user != null) {
   			session.setAttribute(Message.MSG,Message.VALID_LOGIN);
   			session.setAttribute(Message.USERNAME,user.getUsername());
   			session.setAttribute(Message.EMAIL,user.getEmail());
   			response.sendRedirect("profile.jsp");
   			logger.info("this is test");
   	 	}      
        else{
       		session.setAttribute(Message.MSG,Message.INVALID_LOGIN);
       		response.sendRedirect("login.jsp"); 
        }   	 	
%>