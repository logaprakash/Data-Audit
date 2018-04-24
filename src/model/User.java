package model;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class User {
	
	private String username;
	private String email;
	private String password;
	private String community_name;
	private String role;
	private boolean isApproved;
	private boolean isOnline;
	
	public User(){
		this.username = "";
		this.email = "";
		this.password = "";
		this.community_name = "";
		this.role = "";
		this.isApproved = false;
		this.isOnline = false;
	}
	
	public User(String email,String password){
		this.email = email;
		this.password = encrpt(password);
		this.username = "";
		this.community_name = "";
		this.role = "";
		this.isApproved = false;
		this.isOnline = false;
	}
	
	public User(String username,String email,String password){
		this.username = username;
		this.email = email;
		this.password = encrpt(password);
		this.community_name = "";
		this.role = "";
		this.isApproved = false;
		this.isOnline = false;
	}
	public User(String username,String email,String password,String community_name){
		this.username = username;
		this.email = email;
		this.password = encrpt(password);
		this.community_name = community_name;
		this.role = "";
		this.isApproved = false;
		this.isOnline = false;
	}
	public User(String username,String email,String password,String community_name,String role){
		this.username = username;
		this.email = email;
		this.password = encrpt(password);
		this.community_name = community_name;
		this.role = role;
		this.isApproved = false;
		this.isOnline = false;
	}
	public User(String username,String email,String password,String community_name,String role,boolean approved){
		this.username = username;
		this.email = email;
		this.password = encrpt(password);
		this.community_name = community_name;
		this.role = role;
		this.isApproved = approved;
		this.isOnline = false;
	}
	public User(String username,String email,String password,String community_name,String role,boolean approved,boolean online){
		this.username = username;
		this.email = email;
		this.password = encrpt(password);
		this.community_name = community_name;
		this.role = role;
		this.isApproved = approved;
		this.isOnline = online;
	}
	
	public boolean isOnline() {
		return isOnline;
	}

	public void setOnline(boolean isOnline) {
		this.isOnline = isOnline;
	}

	public boolean isApproved() {
		return isApproved;
	}

	public void setApproved(boolean isApproved) {
		this.isApproved = isApproved;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	private String encrpt(String stringToEncrypt){
		String encryptedString = stringToEncrypt;
		MessageDigest messageDigest;
		try {
			messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(stringToEncrypt.getBytes());
			encryptedString = new String(messageDigest.digest());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return encryptedString;
		
	}
	
}
