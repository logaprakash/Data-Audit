<%@ page import ="java.sql.*"
		 import ="controller.*" 
		 import ="org.apache.log4j.Logger" %>
<%
	final Logger logger = Logger.getLogger("validate_user.jsp");
	logger.info("this is test");
	Connection conn = null;
	PreparedStatement pstatement = null;
	String queryString = null;
	ResultSet rs = null;
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
   
    try{
        Class.forName("com.mysql.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?" + "user=root&password=");    
        pstatement = conn.prepareStatement("Select * from user where email=? and password=?");
        pstatement.setString(1, email);
        pstatement.setString(2, password);
        rs = pstatement.executeQuery();
   	 	
        if(rs.next()) {
   			session.setAttribute(Message.MSG,Message.VALID_LOGIN);
   			session.setAttribute(Message.USERNAME,rs.getString(Message.USERNAME));
   			session.setAttribute(Message.EMAIL,rs.getString(Message.EMAIL));
   			response.sendRedirect("profile.jsp");
   	 	}      
        else{
       		session.setAttribute(Message.MSG,Message.INVALID_LOGIN);
       		response.sendRedirect("login.jsp"); 
        }
   	 	
        conn.close();
	 	pstatement.close();
   }
   catch(Exception e){       
       out.println(e.toString());       
   }    
 
%>