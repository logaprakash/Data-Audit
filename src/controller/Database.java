package controller;

import model.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
			queryString = "INSERT INTO user(username,email,password,community_name,role,approved,online) VALUES (?,?,?,?,?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, user.getUsername());
        	pstatement.setString(2, user.getEmail());
        	pstatement.setString(3, user.getPassword()); 
        	pstatement.setString(4, user.getCommunity_name()); 
        	pstatement.setString(5, user.getRole());
        	pstatement.setBoolean(6,user.isApproved());
        	pstatement.setBoolean(7,user.isOnline());
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
			pstatement = conn.prepareStatement("Select * from user where email=? and password=? and community_name=?");
	        pstatement.setString(1, user.getEmail());
	        pstatement.setString(2, user.getPassword());
	        pstatement.setString(3, user.getCommunity_name());
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
    	return temp;
	}
	
	private static User generateUser() throws SQLException{
		return new User(
				resultSet.getString(Message.USERNAME),
				resultSet.getString(Message.EMAIL),
				resultSet.getString(Message.PASSWORD),
				resultSet.getString(Message.COMMUNITY_NAME),
				resultSet.getString(Message.ROLE),
				resultSet.getBoolean(Message.APPROVED),
				resultSet.getBoolean(Message.ONLINE));
	}
	
	
	public static Boolean addStatus(Status status){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "INSERT INTO status(username,email,text,datetime,community_name) VALUES (?,?,?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, status.getUsername());
        	pstatement.setString(2, status.getEmail());
        	pstatement.setString(3, status.getText()); 
        	pstatement.setString(4, (status.getDateTime()).toString()); 
        	pstatement.setString(5, status.getCommunity_name()); 
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
	
	public static ArrayList<Status> getAllStatus(String community_name){
		ArrayList<Status> list = new ArrayList<Status>();
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("SELECT * FROM status WHERE community_name=?");
			pstatement.setString(1,community_name);
	        resultSet = pstatement.executeQuery();
	        while(resultSet.next()){
	            list.add(0,generateStatus());
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
				resultSet.getString(Message.DATETIME),
				resultSet.getString(Message.COMMUNITY_NAME));
	}
	
	public static Boolean setOnline(User user){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "UPDATE user SET online = ? WHERE email = ? and community_name = ?";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setBoolean(1, user.isOnline());
        	pstatement.setString(2, user.getEmail()); 
        	pstatement.setString(3, user.getCommunity_name()); 
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
	
	
	public static ArrayList<User> getAllOnline(User user){
		ArrayList<User> list = new ArrayList<User>();
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("Select * from user WHERE community_name=?");
			pstatement.setString(1,user.getCommunity_name());
	        resultSet = pstatement.executeQuery();
	        while(resultSet.next()){
	        	User temp = generateUser();
	        	if(!temp.getEmail().equals(user.getEmail()))
	        			list.add(temp);
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
	public static Boolean registerCommunity(Community community){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "INSERT INTO community(datetime,community_name,creater_username,creater_email) VALUES (?,?,?,?)";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setString(1, community.getDateTime());
        	pstatement.setString(2, community.getName());
        	pstatement.setString(3, community.getUser().getUsername());
        	pstatement.setString(4, community.getUser().getEmail());
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
	public static ArrayList<User> getAllRequestInCommunity(String community_name){
			ArrayList<User> list = new ArrayList<User>();
			try{
				importJDBC();
				conn = getConnection(url);
				pstatement = conn.prepareStatement("Select * from user where community_name=? and approved = ?");
				pstatement.setString(1, community_name);
				pstatement.setBoolean(2,false);
		        resultSet = pstatement.executeQuery();
		        while(resultSet.next()){
		        	list.add(generateUser());
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
	public static ArrayList<Community> getAllCommunity(HttpSession session){
		ArrayList<Community> list = new ArrayList<Community>();
		try{
			importJDBC();
			conn = getConnection(url);
			pstatement = conn.prepareStatement("Select * from community");
	        resultSet = pstatement.executeQuery();
	        while(resultSet.next()){
	        	list.add(generateCommunity());
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
	private static Community generateCommunity() throws SQLException{
		return new Community(resultSet.getString(Message.COMMUNITY_NAME),resultSet.getString(Message.CREATER_USERNAME),resultSet.getString(Message.CREATER_EMAIL),resultSet.getString(Message.DATETIME));
	}
	
	public static Boolean setApproved(User user){
		try{
			importJDBC();
			conn = getConnection(url);
			queryString = "UPDATE user SET approved = ? WHERE email = ? and community_name = ?";
        	pstatement = conn.prepareStatement(queryString);
        	pstatement.setBoolean(1, user.isApproved());
        	pstatement.setString(2, user.getEmail()); 
        	pstatement.setString(3, user.getCommunity_name()); 
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
