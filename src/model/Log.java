package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.net.*;

public class Log {
	private String classname;
	private String level;
	private String dateTime;
	private String value;
	private String hostAddress;
	private String hostName;
	
	public Log(){
		classname = "";
		level = "";
		dateTime = "";
		value = "";
		hostAddress = "";
		hostName = "";
	}
	public Log(String classname,String level,String value){
		this.classname = classname;
		this.level = level;
		this.dateTime = getDate();
		this.value = value;
		InetAddress inetAddress;
		try {
			inetAddress = InetAddress.getLocalHost();
			this.hostAddress = inetAddress.getHostAddress();
			this.hostName = inetAddress.getHostName();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			this.hostAddress = "Unknown Host Address";
			this.hostName = "Unknown Host Name";
			e.printStackTrace();
		}
		
	}
	
	public String getHostAddress() {
		return hostAddress;
	}
	public void setHostAddress(String hostAddress) {
		this.hostAddress = hostAddress;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	private String getDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return dateFormat.format(new Date());
	}
}
