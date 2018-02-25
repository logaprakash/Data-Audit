<%@ page import ="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstatement = null;
	String queryString = null;
    String name = request.getParameter("name");  
    String email = request.getParameter("email");  
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    if(confirmPassword.equals(password)){
    	try{
        	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?" + "user=root&password=");    
        	queryString = "INSERT INTO user(name,email,password) VALUES (?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, name);
        	pstatement.setString(2, email);
        	pstatement.setString(3, password);   
        	pstatement.executeUpdate();
   		}
   		catch(Exception e){       
       		out.println(e.toString());       
   		}    
   		finally{
	 		conn.close();
	 		pstatement.close();
	 		response.sendRedirect("login.jsp");
   		}
    }
    
%>