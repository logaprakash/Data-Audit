package controller;

import model.*;
import java.sql.*;
import java.util.ArrayList;

public class Database {
	private static final String username = "root";
	private static final String password = "";
	private static final String url = "jdbc:mysql://localhost:3306/users?"
									+ "user=" +username
									+ "&password=" +password;
	private static final String audit_url = "jdbc:mysql://localhost:3306/data_audit?"
		+ "user=" +username
		+ "&password=" +password;
	
	private static Connection conn = null;
	private static PreparedStatement pstatement = null;
	private static String queryString = null;
	private static ResultSet resultSet = null;

	private static void importJDBC(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		catch(Exception e){
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
	}
	
	private static Connection getConnection(String url){
		try{
			return DriverManager.getConnection(url);
		}catch(Exception e){
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
			return null;
		}
	}
	
	public static Boolean registerUser(User user){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "INSERT INTO user(username,email,password) VALUES (?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, user.getUsername());
        	pstatement.setString(2, user.getEmail());
        	pstatement.setString(3, user.getPassword());   
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
	 		return true;
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return false;
	}
	
	public static User validateUser(User user){
		User temp = null;
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("Select * from user where email=? and password=?");
	        pstatement.setString(1, user.getEmail());
	        pstatement.setString(2, user.getPassword());
	        resultSet = pstatement.executeQuery();	   	 	
	        if(resultSet.next()) {
	        	temp = generateUser();
	   	 	}   
	        resultSet.close();
        	conn.close();
	 		pstatement.close();
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		putOnline(temp);
    	return temp;
	}
	
	private static User generateUser() throws SQLException{
		return new User(resultSet.getString(Message.USERNAME),resultSet.getString(Message.EMAIL),resultSet.getString(Message.PASSWORD));
	}
	
	private static User generateOnlineUser() throws SQLException{
		User temp = new User();
		temp.setUsername(resultSet.getString(Message.USERNAME));
		temp.setEmail(resultSet.getString(Message.EMAIL));
		return temp;
	}
	
	public static Boolean addStatus(Status status){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "INSERT INTO status(username,email,text,datetime) VALUES (?,?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, status.getUsername());
        	pstatement.setString(2, status.getEmail());
        	pstatement.setString(3, status.getText()); 
        	pstatement.setString(4, (status.getDateTime()).toString()); 
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
	 		return true;
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return false;
	}
	
	public static ArrayList<Status> getAllStatus(){
		ArrayList<Status> list = new ArrayList<Status>();
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("Select * from status");
	        resultSet = pstatement.executeQuery();
	        while(resultSet.next()){
	            list.add(generateStatus());
	         }
	        resultSet.close();
        	conn.close();
	 		pstatement.close();
		}catch(Exception e){
			clean();		
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return list;
	}
	
	private static Status generateStatus() throws SQLException{
		return new Status(resultSet.getString(Message.USERNAME),
				resultSet.getString(Message.EMAIL),
				resultSet.getString(Message.TEXT),
				resultSet.getString(Message.DATETIME));
	}
	
	private static Boolean putOnline(User user){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "INSERT INTO online(username,email) VALUES (?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, user.getUsername());
        	pstatement.setString(2, user.getEmail()); 
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
	 		return true;
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return false;
	}
	
	public static Boolean putOffline(String email){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "DELETE FROM online WHERE email='"+email+"'";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
	 		return true;
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return false;
	}
	
	public static ArrayList<User> getAllOnline(){
		ArrayList<User> list = new ArrayList<User>();
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("Select * from online");
	        resultSet = pstatement.executeQuery();
	        while(resultSet.next()){
	            list.add(generateOnlineUser());
	         }
	        resultSet.close();
        	conn.close();
	 		pstatement.close();
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return list;
	}
	
	public static Boolean addLog(Log log){
		try{
			importJDBC();
			conn = getConnection(audit_url);
			queryString = "INSERT INTO log(level,classname,datetime,value) VALUES (?,?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, log.getLevel());
        	pstatement.setString(2, log.getClassname());
        	pstatement.setString(3, log.getDateTime()); 
        	pstatement.setString(4, log.getValue()); 
        	pstatement.executeUpdate();
        	conn.close();
	 		pstatement.close();
	 		return true;
		}catch(Exception e){
			clean();
			CustomLog.log(Message.DATABASE_CLASS, Message.LOG_FATAL, e.toString());
		}
		return false;
	}
	
	private static void clean(){
		resultSet = null;
		pstatement = null;
		conn = null;
	}
	
}
