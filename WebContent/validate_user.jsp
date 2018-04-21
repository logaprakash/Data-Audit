<%@ page import ="controller.*" 
		 import ="model.*" 
		 %>
<%
	
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    String community_name = request.getParameter("community");
    User temp = new User(email,password);
    temp.setCommunity_name(community_name);
    User user = Database.validateUser(temp);
    Session.Init(request.getSession());
    out.print(user.getEmail());
    out.println(String.valueOf(user.isApproved()));
    
    	if(user != null) {
    			
    		if(user.isApproved()){
    			user.setOnline(true);
    			Database.setOnline(user);
				Session.generateSession(user);
				Session.addMsg(Message.VALID_LOGIN);
   				response.sendRedirect("profile.jsp");
   				CustomLog.log("validate_user",Message.LOG_INFO,user.getEmail()+" - " + Message.VALID_LOGIN);
    		}
    		else{
    			Session.addMsg(Message.INFO_NOT_APPROVED);
           		CustomLog.log("validate_user",Message.LOG_INFO,email+ " - " +Message.NOT_APPROVED+community_name);
           		response.sendRedirect("login.jsp");
    		}
   	 	}      
        else{
       		Session.addMsg(Message.INVALID_LOGIN);
       		CustomLog.log("validate_user",Message.LOG_INFO,email+ " - " +Message.INVALID_LOGIN);
       		response.sendRedirect("login.jsp"); 
        }   	
%>