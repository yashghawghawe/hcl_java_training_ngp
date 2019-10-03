package net.javaguides.jsp.jdbc.bean;
import java.io.Serializable;
public class Employee implements Serializable{
/**
  */
	private static final long serialversionUID=1;
	private String firstname;
	private String lastname;
	private String username;
	private String password;
	private String address;
	private String contact;
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public static void main(String[] args) {
		
	}

}
