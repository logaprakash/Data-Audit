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
			// log data
		}
		catch(Exception e){
			// log data
		}
	}
	
	private static Connection getConnection(String url){
		try{
			return DriverManager.getConnection(url);
		}catch(Exception e){
			//log data
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
			// log data
		}
		return false;
	}
	
	public static User validateUser(User user){
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("Select * from user where email=? and password=?");
	        pstatement.setString(1, user.getEmail());
	        pstatement.setString(2, user.getPassword());
	        resultSet = pstatement.executeQuery();	   	 	
	        if(resultSet.next()) {
	   			return generateUser();
	   	 	}   
	        resultSet.close();
        	conn.close();
	 		pstatement.close();
		}catch(Exception e){
			// log data
		}
		return null;
	}
	
	private static User generateUser() throws SQLException{
		return new User(resultSet.getString(Message.USERNAME),resultSet.getString(Message.EMAIL),resultSet.getString(Message.PASSWORD));
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
			System.out.print(e.toString());
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
			// log data
		  System.out.println(e.toString());
		}
		return list;
	}
	
	private static Status generateStatus() throws SQLException{
		return new Status(resultSet.getString(Message.USERNAME),
				resultSet.getString(Message.EMAIL),
				resultSet.getString(Message.TEXT),
				resultSet.getString(Message.DATETIME));
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
			System.out.print(e.toString());
		}
		return false;
	}
}
