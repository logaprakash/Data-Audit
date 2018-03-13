package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Status {
	private String username;
	private String email;
	private String text;
	private String dateTime;
	
	public Status(){
		this.username = "";
		this.email = "";
		this.text = "";  
		this.dateTime = getDate(); 
	}
	
	public Status(String username,String email,String text){
		this.username = username;
		this.email = email;
		this.text = text;
		this.dateTime = getDate(); 
	}
	
	public Status(String username,String email,String text,String dateTime){
		this.username = username;
		this.email = email;
		this.text = text;
		this.dateTime = dateTime; 
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
