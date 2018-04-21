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
		if(!user.getCommunity_name().equals("")){
			httpSession.setAttribute(Message.COMMUNITY_NAME,user.getCommunity_name());
		}
		if(!user.getRole().equals("")){
			httpSession.setAttribute(Message.ROLE,user.getRole());
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
	public static String getCommunity_name(){
		String temp = (String)httpSession.getAttribute(Message.COMMUNITY_NAME);
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
	public static String getRole(){
		String temp = (String)httpSession.getAttribute(Message.ROLE);
		if(temp!=null)
			return temp;
		return "";
	}
	public static void addCount(){
		if(httpSession.getAttribute(Message.POST_COUNT)==null)
			httpSession.setAttribute(Message.POST_COUNT,getCount());
		else
			httpSession.setAttribute(Message.POST_COUNT,getCount()+1);
	}
	public static int getCount(){
		String temp = (String)httpSession.getAttribute(Message.POST_COUNT);
		if(temp!=null)
			return Integer.valueOf(temp);
		return 0;
	}
	
	public static User getSessionUser(){
		User temp  = new User();
		temp.setCommunity_name(getCommunity_name());
		temp.setEmail(getEmail());
		temp.setUsername(getUsername());
		return temp;
	}
	
}
