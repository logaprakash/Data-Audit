<%@ page import ="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstatement = null;
	String queryString = null;
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    try{
        Class.forName("com.mysql.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?" + "user=root&password=");    
        pstatement = conn.prepareStatement("Select email,password from user where email=? and password=?");
        pstatement.setString(1, email);
        pstatement.setString(2, password);
        ResultSet rs = pstatement.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials"); 
   }
   catch(Exception e){       
       out.println(e.toString());       
   }    
   finally{
	 conn.close();
	 pstatement.close();
   }
%>