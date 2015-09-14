package com.ommay.entity;

/**
 * AccountDoctor entity. @author MyEclipse Persistence Tools
 */

public class AccountDoctor implements java.io.Serializable {

	// Fields

	private String accountDoctor = "accountDoctor";
	private Account account;
	private String departmentDoctor = "departmentDoctor";
	private String positionDoctor = "positionDoctor";
	private String nameDoctor = "nameDoctor";
	private String phoneDoctor = "123456";
	private String emailDoctor = "123@gmail.com";

	// Constructors

	/** default constructor */
	public AccountDoctor() {
		this.accountDoctor = "departmentDoctor";
		this.departmentDoctor = "departmentDoctor";
		this.positionDoctor =  "positionDoctor";
		this.nameDoctor = "nameDoctor";
		this.phoneDoctor = "123456";
		this.emailDoctor = "123@gmail.com";
	}

	/** minimal constructor */
	public AccountDoctor(String accountDoctor) {
		this.accountDoctor = accountDoctor;
	}

	/** full constructor */
	public AccountDoctor(String accountDoctor, Account account,
			String departmentDoctor, String positionDoctor, String nameDoctor,
			String phoneDoctor, String emailDoctor) {
		this.accountDoctor = accountDoctor;
		this.account = account;
		this.departmentDoctor = departmentDoctor;
		this.positionDoctor = positionDoctor;
		this.nameDoctor = nameDoctor;
		this.phoneDoctor = phoneDoctor;
		this.emailDoctor = emailDoctor;
	}

	// Property accessors

	public String getAccountDoctor() {
		return this.accountDoctor;
	}

	public void setAccountDoctor(String accountDoctor) {
		this.accountDoctor = accountDoctor;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getDepartmentDoctor() {
		return this.departmentDoctor;
	}

	public void setDepartmentDoctor(String departmentDoctor) {
		this.departmentDoctor = departmentDoctor;
	}

	public String getPositionDoctor() {
		return this.positionDoctor;
	}

	public void setPositionDoctor(String positionDoctor) {
		this.positionDoctor = positionDoctor;
	}

	public String getNameDoctor() {
		return this.nameDoctor;
	}

	public void setNameDoctor(String nameDoctor) {
		this.nameDoctor = nameDoctor;
	}

	public String getPhoneDoctor() {
		return this.phoneDoctor;
	}

	public void setPhoneDoctor(String phoneDoctor) {
		this.phoneDoctor = phoneDoctor;
	}

	public String getEmailDoctor() {
		return this.emailDoctor;
	}

	public void setEmailDoctor(String emailDoctor) {
		this.emailDoctor = emailDoctor;
	}

}