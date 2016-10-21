package com.shuohe.userManage;

public class User {
	String name;
	String password;
	String mail;
	String signUpDate;	
	int status;
	
	public User(String name,String password,String mail,String signUpDate,int status)
	{
		this.name = name;
		this.password = password;
		this.mail = mail;
		this.signUpDate = signUpDate;
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
