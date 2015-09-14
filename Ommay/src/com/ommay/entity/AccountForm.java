package com.ommay.entity;

import java.util.Set;

/**
 * Account 验证类
 * @author hs 2015/8/19
 *
 */
public class AccountForm implements java.io.Serializable {

	// Fields

	private String account;
	private String password;
//	private String newPassword;
	private Integer accountFlag;
//	private Set accountFinances = new HashSet(0);
//	private Set accountClients = new HashSet(0);
//	private Set accountManagers = new HashSet(0);
//	private Set accountWorkers = new HashSet(0);
//	private Set accountGroups = new HashSet(0);
//	private Set projects = new HashSet(0);
//	private Set accountDoctors = new HashSet(0);

	// Constructors

	/** default constructor */
	public AccountForm() {
	}

	/** minimal constructor */
	public AccountForm(String account) {
		this.account = account;
	}

	/** full constructor */
	public AccountForm(String account, String password,Integer accountFlag) {
		this.account = account;
		this.password = password;
		this.accountFlag = accountFlag;
//		this.newPassword = newPassword;
	}

	// Property accessors

//	public String getNewPassword() {
//		return newPassword;
//	}
//
//	public void setNewPassword(String newPassword) {
//		this.newPassword = newPassword;
//	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAccountFlag() {
		return this.accountFlag;
	}

	public void setAccountFlag(Integer accountFlag) {
		this.accountFlag = accountFlag;
	}

}
