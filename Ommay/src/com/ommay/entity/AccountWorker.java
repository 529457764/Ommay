package com.ommay.entity;

/**
 * AccountWorker entity. @author MyEclipse Persistence Tools
 */

public class AccountWorker implements java.io.Serializable {

	// Fields

	private String accountWorker = "accountWorker";
	private Account account;
	private String emailWorker = "emailWorker";
	private String departmentWorker = "departmentWorker";
	private String positionWorker = "positionWorker";
	private String nameWorker = "nameWorker";
	private String phoneWorker = "123456";

	// Constructors

	/** default constructor */
	public AccountWorker() {
		this.accountWorker ="accountWorker";
		this.emailWorker =  "emailWorker";
		this.departmentWorker = "departmentWorker";
		this.positionWorker = "positionWorker";
		this.nameWorker = "nameWorker";
		this.phoneWorker = "123456";
	}

	/** minimal constructor */
	public AccountWorker(String accountWorker) {
		this.accountWorker = accountWorker;
	}

	/** full constructor */
	public AccountWorker(String accountWorker, Account account,
			String emailWorker, String departmentWorker, String positionWorker,
			String nameWorker, String phoneWorker) {
		this.accountWorker = accountWorker;
		this.account = account;
		this.emailWorker = emailWorker;
		this.departmentWorker = departmentWorker;
		this.positionWorker = positionWorker;
		this.nameWorker = nameWorker;
		this.phoneWorker = phoneWorker;
	}

	// Property accessors

	public String getAccountWorker() {
		return this.accountWorker;
	}

	public void setAccountWorker(String accountWorker) {
		this.accountWorker = accountWorker;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getEmailWorker() {
		return this.emailWorker;
	}

	public void setEmailWorker(String emailWorker) {
		this.emailWorker = emailWorker;
	}

	public String getDepartmentWorker() {
		return this.departmentWorker;
	}

	public void setDepartmentWorker(String departmentWorker) {
		this.departmentWorker = departmentWorker;
	}

	public String getPositionWorker() {
		return this.positionWorker;
	}

	public void setPositionWorker(String positionWorker) {
		this.positionWorker = positionWorker;
	}

	public String getNameWorker() {
		return this.nameWorker;
	}

	public void setNameWorker(String nameWorker) {
		this.nameWorker = nameWorker;
	}

	public String getPhoneWorker() {
		return this.phoneWorker;
	}

	public void setPhoneWorker(String phoneWorker) {
		this.phoneWorker = phoneWorker;
	}

}