package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Community{
	private String name;
	private String DateTime;
	private User user;
	public Community(){
		this.name="";
		this.DateTime = getDate();
		this.user = new User();
	}
	public Community(String name,String username,String email){
		this.name=name;
		this.DateTime = getDate();
		this.user = new User();
		this.user.setUsername(username);
		this.user.setEmail(email);
	}
	public Community(String name,String username,String email,String datetime){
		this.name = name;
		this.user = new User();
		this.user.setUsername(username);
		this.user.setEmail(email);
		this.DateTime = datetime;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getDateTime() {
		return DateTime;
	}
	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	private String getDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return dateFormat.format(new Date());
	}
}
