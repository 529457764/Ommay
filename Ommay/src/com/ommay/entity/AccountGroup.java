package com.ommay.entity;

/**
 * AccountGroup entity. @author MyEclipse Persistence Tools
 */

public class AccountGroup implements java.io.Serializable {

	// Fields

	private String accountGroup = "accountGroup";
	private Account account;
	private String nameMaster = "nameMaster";
	private String phoneMaster = "123456";
	private String workingPhoneMaster = "666666";
	private String emailGroup = "123@123.com";

	// Constructors

	/** default constructor */
	public AccountGroup() {
		this.accountGroup = "accountGroup";
		this.nameMaster = "nameMaster";
		this.phoneMaster = "123456";
		this.workingPhoneMaster = "666666";
		this.emailGroup = "123@123.com";
	}

	/** minimal constructor */
	public AccountGroup(String accountGroup) {
		this.accountGroup = accountGroup;
	}

	/** full constructor */
	public AccountGroup(String accountGroup, Account account,
			String nameMaster, String phoneMaster, String workingPhoneMaster,
			String emailGroup) {
		this.accountGroup = accountGroup;
		this.account = account;
		this.nameMaster = nameMaster;
		this.phoneMaster = phoneMaster;
		this.workingPhoneMaster = workingPhoneMaster;
		this.emailGroup = emailGroup;
	}

	// Property accessors

	public String getAccountGroup() {
		return this.accountGroup;
	}

	public void setAccountGroup(String accountGroup) {
		this.accountGroup = accountGroup;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getNameMaster() {
		return this.nameMaster;
	}

	public void setNameMaster(String nameMaster) {
		this.nameMaster = nameMaster;
	}

	public String getPhoneMaster() {
		return this.phoneMaster;
	}

	public void setPhoneMaster(String phoneMaster) {
		this.phoneMaster = phoneMaster;
	}

	public String getWorkingPhoneMaster() {
		return this.workingPhoneMaster;
	}

	public void setWorkingPhoneMaster(String workingPhoneMaster) {
		this.workingPhoneMaster = workingPhoneMaster;
	}

	public String getEmailGroup() {
		return this.emailGroup;
	}

	public void setEmailGroup(String emailGroup) {
		this.emailGroup = emailGroup;
	}

}