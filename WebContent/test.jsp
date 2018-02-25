<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
try {
	// This will load the MySQL driver, each DB has its own driver
	Class.forName("com.mysql.jdbc.Driver");

	//Setup the connection with the DB
	Connection connect = DriverManager.getConnection("jdbc:mysql://" + "localhost:3306" + "/"
			+ "users" + "?" + "user=" + "root" + "&password=" + "");

	
} catch (Exception e) {
	 throw e;
}
	
%>