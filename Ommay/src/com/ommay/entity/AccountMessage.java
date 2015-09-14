package com.ommay.entity;
/**
 * 
 * @author hs 2015/8/25
 *
 */
public class AccountMessage {
	public String name;
	public String sex;
	public String iphone;
	public String email;
	public String company;
	
	
	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public AccountMessage() {
		super();
	}


	public AccountMessage(String name, String sex, String iphone, String email) {
		super();
		this.name = name;
		this.sex = sex;
		this.iphone = iphone;
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getIphone() {
		return iphone;
	}


	public void setIphone(String iphone) {
		this.iphone = iphone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
