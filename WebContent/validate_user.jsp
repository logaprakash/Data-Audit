<%@ page import ="controller.*" 
		 import ="model.*" 
		 %>
<%
	
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    String community_name = request.getParameter("community");
    User temp = new User(email,password);
    temp.setCommunity_name(community_name);
    try{
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
   				CustomLog.log("validate_user",Message.LOG_INFO,user.getEmail()+" at " + user.getCommunity_name()+" - "+Message.VALID_LOGIN);
    		}
    		else{
    			Session.addMsg(Message.INFO_NOT_APPROVED);
           		CustomLog.log("validate_user",Message.LOG_WARN,email+" at " + user.getCommunity_name()+" - "+Message.NOT_APPROVED);
           		response.sendRedirect("login.jsp");
    		}
   	 	}      
        else{
       		Session.addMsg(Message.INVALID_LOGIN);
       		CustomLog.log("validate_user",Message.LOG_WARN,email+" at " + user.getCommunity_name()+" - "+Message.INVALID_LOGIN);
       		response.sendRedirect("login.jsp"); 
        }   
    }
    catch(Exception e){
    	Session.addMsg(Message.USER_UNAVAILABLE);
    	CustomLog.log("validate_user",Message.LOG_WARN,email+" at " + community_name+" - "+Message.USER_UNAVAILABLE);
    	response.sendRedirect("login.jsp"); 
    }
%>