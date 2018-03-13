package model;

import java.sql.Date;


public class Status {
	private String username;
	private String email;
	private String text;
	private Date dateTime;
	
	public Status(){
		this.username = "";
		this.email = "";
		this.text = "";
		long millis=System.currentTimeMillis();  
		this.dateTime = new Date(millis);
	}
	
	public Status(String username,String email,String text){
		this.username = username;
		this.email = email;
		this.text = text;
		long millis=System.currentTimeMillis();  
		this.dateTime = new Date(millis);
	}
	
	public Status(String username,String email,String text,Date dateTime){
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

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	
	
	
}
