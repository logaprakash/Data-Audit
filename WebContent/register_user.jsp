<%@ page import ="java.sql.*"
		 import = "controller.*" %>
<%
	Connection conn = null;
	PreparedStatement pstatement = null;
	String queryString = null;
    String username = request.getParameter("username");  
    String email = request.getParameter("email");  
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    if(confirmPassword.equals(password)){
    	try{
        	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?" + "user=root&password=");    
        	queryString = "INSERT INTO user(username,email,password) VALUES (?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, username);
        	pstatement.setString(2, email);
        	pstatement.setString(3, password);   
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
        	response.sendRedirect("login.jsp");
   		}
   		catch(Exception e){  
   			session.setAttribute(Message.MSG,Message.ALREADY_USER_EXIST);
   			response.sendRedirect("signup.jsp");   
   		}    
    }
    else{
    	session.setAttribute(Message.MSG,Message.PASSWORD_MISMATCH);
		response.sendRedirect("signup.jsp");
    }
    
%>