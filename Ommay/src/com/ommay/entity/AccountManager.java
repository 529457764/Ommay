package com.ommay.entity;

/**
 * AccountManager entity. @author MyEclipse Persistence Tools
 */

public class AccountManager implements java.io.Serializable {

	// Fields

	private String accountManager = "manager";
	private Account account;
	private String emailManager = "222@163.com";
	private String departmentManager = "departmentManager";
	private String positionManager = "positionManager";
	private String nameManager = "name";
	private String phoneManager = "123456";

	// Constructors

	/** default constructor */
	public AccountManager() {
		this.accountManager ="manager";
		this.emailManager = "222@163.com";
		this.departmentManager ="departmentManager";
		this.positionManager = "positionManager";
		this.nameManager ="manager";
		this.phoneManager =  "123456";
	}

	/** minimal constructor */
	public AccountManager(String accountManager) {
		this.accountManager = accountManager;
	}

	/** full constructor */
	public AccountManager(String accountManager, Account account,
			String emailManager, String departmentManager,
			String positionManager, String nameManager, String phoneManager) {
		this.accountManager = accountManager;
		this.account = account;
		this.emailManager = emailManager;
		this.departmentManager = departmentManager;
		this.positionManager = positionManager;
		this.nameManager = nameManager;
		this.phoneManager = phoneManager;
	}

	// Property accessors

	public String getAccountManager() {
		return this.accountManager;
	}

	public void setAccountManager(String accountManager) {
		this.accountManager = accountManager;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getEmailManager() {
		return this.emailManager;
	}

	public void setEmailManager(String emailManager) {
		this.emailManager = emailManager;
	}

	public String getDepartmentManager() {
		return this.departmentManager;
	}

	public void setDepartmentManager(String departmentManager) {
		this.departmentManager = departmentManager;
	}

	public String getPositionManager() {
		return this.positionManager;
	}

	public void setPositionManager(String positionManager) {
		this.positionManager = positionManager;
	}

	public String getNameManager() {
		return this.nameManager;
	}

	public void setNameManager(String nameManager) {
		this.nameManager = nameManager;
	}

	public String getPhoneManager() {
		return this.phoneManager;
	}

	public void setPhoneManager(String phoneManager) {
		this.phoneManager = phoneManager;
	}

}