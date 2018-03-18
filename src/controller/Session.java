package controller;

import javax.servlet.http.HttpSession;

import model.*;

public class Session {

	private static HttpSession httpSession = null; 
	  
	  
	public static void Init(HttpSession temp){
	        httpSession = temp;
	}
	   
	public static void generateSession(User user){
		if(!user.getEmail().equals("")){
			httpSession.setAttribute(Message.EMAIL,user.getEmail());
		}
		if(!user.getUsername().equals("")){
			httpSession.setAttribute(Message.USERNAME,user.getUsername());
		}
	}
	
	public static void addMsg(String value){
		if(httpSession.getAttribute(Message.MSG)==null)
			httpSession.setAttribute(Message.MSG,value);
	}
	
	public static void removeMsg(){
		if(httpSession.getAttribute(Message.MSG)!=null)
			httpSession.removeAttribute(Message.MSG);
	}
	
	public static void clean(){
		httpSession.removeAttribute(Message.USERNAME);
		httpSession.removeAttribute(Message.EMAIL);
	}
	
	public static Boolean isUserLogged(){
		if(httpSession.getAttribute(Message.USERNAME)!=null)
			return true;
		return false;
	}
	
	public static String getUsername(){
		String temp = (String)httpSession.getAttribute(Message.USERNAME);
		if(temp!=null)
			return temp;
		return "";
	}
	public static String getEmail(){
		String temp = (String)httpSession.getAttribute(Message.EMAIL);
		if(temp!=null)
			return temp;
		return "";
	}
	public static String getMsg(){
		String temp = (String)httpSession.getAttribute(Message.MSG);
		if(temp!=null)
			return temp;
		return "";
	}
	
}
