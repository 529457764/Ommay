package com.ommay.entity;

/**
 * AccountFinance entity. @author MyEclipse Persistence Tools
 */

public class AccountFinance implements java.io.Serializable {

	// Fields

	private String accountFinance = "accountFinance";
	private Account account;
	private String emailFinance = "123456@1.com";
	private String departmentFinance = "departmentFinance";
	private String positionFinance = "positionFinance";
	private String nameFinance = "nameFinance";
	private String phoneFinance = "123456";

	// Constructors

	/** default constructor */
	public AccountFinance() {
		this.accountFinance = "accountFinance";
		this.emailFinance = "123456@1.com";
		this.departmentFinance = "departmentFinance";
		this.positionFinance =  "positionFinance";
		this.nameFinance = "nameFinance";
		this.phoneFinance = "123456";
	}

	/** minimal constructor */
	public AccountFinance(String accountFinance) {
		this.accountFinance = accountFinance;
	}

	/** full constructor */
	public AccountFinance(String accountFinance, Account account,
			String emailFinance, String departmentFinance,
			String positionFinance, String nameFinance, String phoneFinance) {
		this.accountFinance = accountFinance;
		this.account = account;
		this.emailFinance = emailFinance;
		this.departmentFinance = departmentFinance;
		this.positionFinance = positionFinance;
		this.nameFinance = nameFinance;
		this.phoneFinance = phoneFinance;
	}

	// Property accessors

	public String getAccountFinance() {
		return this.accountFinance;
	}

	public void setAccountFinance(String accountFinance) {
		this.accountFinance = accountFinance;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getEmailFinance() {
		return this.emailFinance;
	}

	public void setEmailFinance(String emailFinance) {
		this.emailFinance = emailFinance;
	}

	public String getDepartmentFinance() {
		return this.departmentFinance;
	}

	public void setDepartmentFinance(String departmentFinance) {
		this.departmentFinance = departmentFinance;
	}

	public String getPositionFinance() {
		return this.positionFinance;
	}

	public void setPositionFinance(String positionFinance) {
		this.positionFinance = positionFinance;
	}

	public String getNameFinance() {
		return this.nameFinance;
	}

	public void setNameFinance(String nameFinance) {
		this.nameFinance = nameFinance;
	}

	public String getPhoneFinance() {
		return this.phoneFinance;
	}

	public void setPhoneFinance(String phoneFinance) {
		this.phoneFinance = phoneFinance;
	}

}