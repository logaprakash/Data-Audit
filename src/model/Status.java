package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Status {
	private String username;
	private String email;
	private String text;
	private String dateTime;
	private String community_name;
	
	public Status(){
		this.username = "";
		this.email = "";
		this.text = "";  
		this.community_name = "";
		this.dateTime = getDate(); 
	}
	
	public Status(String username,String email,String text,String community_name){
		this.username = username;
		this.email = email;
		this.text = text;
		this.community_name = community_name;
		this.dateTime = getDate(); 
	}
	
	public Status(String username,String email,String text,String dateTime,String community_name){
		this.username = username;
		this.email = email;
		this.text = text;
		this.community_name = community_name;
		this.dateTime = dateTime; 
	}
	
	
	public String getCommunity_name() {
		return community_name;
	}

	public void setCommunity_name(String community_name) {
		this.community_name = community_name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	private String getDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return dateFormat.format(new Date());
	}
	
}
