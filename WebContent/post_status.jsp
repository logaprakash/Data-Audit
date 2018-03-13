<%@ page import ="java.sql.*"
		 import = "controller.*" %>
<%
	Connection conn = null;
	PreparedStatement pstatement = null;
	String queryString = null;
	String username = (String)session.getAttribute(Message.USERNAME); 
	String email = (String)session.getAttribute(Message.EMAIL);  
    String status_input = request.getParameter("status_input");
    	try{
        	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?" + "user=root&password=");    
        	queryString = "INSERT INTO status(username,email,status) VALUES (?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, username);
        	pstatement.setString(2, email);
        	pstatement.setString(3, status_input);   
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
        	response.sendRedirect("profile.jsp");
   		}
   		catch(Exception e){  
   			session.setAttribute(Message.MSG,Message.ALREADY_USER_EXIST);
   			response.sendRedirect("profile.jsp");   
   		}    

   
    
%>