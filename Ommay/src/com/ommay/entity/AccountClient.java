package com.ommay.entity;

/**
 * AccountClient entity. @author MyEclipse Persistence Tools
 */

public class AccountClient implements java.io.Serializable {

	// Fields

	private String accountClient = "accountClient";
	private Account account;
	private String nameClient = "";
	private String sexClient =  "男";
	private String phoneClient = "123456";
	private String identityCardNumber = "440101197708191263";
	private String emailClient =  "163@163.com";
	private String sicknessHistory ="无";
	private String addressClient =  "天朝";

	// Constructors

	/** default constructor */
	public AccountClient() {
		this.accountClient = "accountClient";
		this.nameClient = "nameClient";
		this.sexClient = "男";
		this.phoneClient = "123456";
		this.identityCardNumber = "440101197708191263";
		this.emailClient = "163@163.com";
		this.sicknessHistory = "无";
		this.addressClient = "天朝";
	}

	/** minimal constructor */
	public AccountClient(String accountClient) {
		this.accountClient = accountClient;
	}

	/** full constructor */
	public AccountClient(String accountClient, Account account,
			String nameClient, String sexClient, String phoneClient,
			String identityCardNumber, String emailClient,
			String sicknessHistory, String addressClient) {
		this.accountClient = accountClient;
		this.account = account;
		this.nameClient = nameClient;
		this.sexClient = sexClient;
		this.phoneClient = phoneClient;
		this.identityCardNumber = identityCardNumber;
		this.emailClient = emailClient;
		this.sicknessHistory = sicknessHistory;
		this.addressClient = addressClient;
	}

	// Property accessors

	public String getAccountClient() {
		return this.accountClient;
	}

	public void setAccountClient(String accountClient) {
		this.accountClient = accountClient;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getNameClient() {
		return this.nameClient;
	}

	public void setNameClient(String nameClient) {
		this.nameClient = nameClient;
	}

	public String getSexClient() {
		return this.sexClient;
	}

	public void setSexClient(String sexClient) {
		this.sexClient = sexClient;
	}

	public String getPhoneClient() {
		return this.phoneClient;
	}

	public void setPhoneClient(String phoneClient) {
		this.phoneClient = phoneClient;
	}

	public String getIdentityCardNumber() {
		return this.identityCardNumber;
	}

	public void setIdentityCardNumber(String identityCardNumber) {
		this.identityCardNumber = identityCardNumber;
	}

	public String getEmailClient() {
		return this.emailClient;
	}

	public void setEmailClient(String emailClient) {
		this.emailClient = emailClient;
	}

	public String getSicknessHistory() {
		return this.sicknessHistory;
	}

	public void setSicknessHistory(String sicknessHistory) {
		this.sicknessHistory = sicknessHistory;
	}

	public String getAddressClient() {
		return this.addressClient;
	}

	public void setAddressClient(String addressClient) {
		this.addressClient = addressClient;
	}

}