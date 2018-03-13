package controller;

import java.util.Date;

public class Status {
	private String username;
	private String email;
	private String text;
	private Date dateTime;
	
	Status(){
		this.username = "";
		this.email = "";
		this.text = "";
		this.dateTime = new Date();
	}
	
	Status(String username,String email,String text){
		this.username = username;
		this.email = email;
		this.text = text;
		this.dateTime = new Date();
		
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
