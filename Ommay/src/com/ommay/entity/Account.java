package com.ommay.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Account entity. @author MyEclipse Persistence Tools
 */

public class Account implements java.io.Serializable {

	// Fields

	private String account = "account";
	private String password = "123";
	private Integer accountFlag = 0;
//	private Set accountFinances = new HashSet(0);
//	private Set accountClients = new HashSet(0);
//	private Set accountManagers = new HashSet(0);
//	private Set accountWorkers = new HashSet(0);
//	private Set accountGroups = new HashSet(0);
//	private Set accountDoctors = new HashSet(0);

	// Constructors

	/** default constructor */
	public Account() {
		this.account = "account";
		this.password = "123";
		this.accountFlag = 0;
	}

	/** minimal constructor */
	public Account(String account) {
		this.account = account;
	}

	/** full constructor */
	public Account(String account, String password, Integer accountFlag,
			Set accountFinances, Set accountClients, Set accountManagers,
			Set accountWorkers, Set accountGroups, Set accountDoctors) {
		this.account = account;
		this.password = password;
		this.accountFlag = accountFlag;
//		this.accountFinances = accountFinances;
//		this.accountClients = accountClients;
//		this.accountManagers = accountManagers;
//		this.accountWorkers = accountWorkers;
//		this.accountGroups = accountGroups;
//		this.accountDoctors = accountDoctors;
	}

	// Property accessors

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

//	public Set getAccountFinances() {
//		return this.accountFinances;
//	}
//
//	public void setAccountFinances(Set accountFinances) {
//		this.accountFinances = accountFinances;
//	}
//
//	public Set getAccountClients() {
//		return this.accountClients;
//	}
//
//	public void setAccountClients(Set accountClients) {
//		this.accountClients = accountClients;
//	}
//
//	public Set getAccountManagers() {
//		return this.accountManagers;
//	}
//
//	public void setAccountManagers(Set accountManagers) {
//		this.accountManagers = accountManagers;
//	}
//
//	public Set getAccountWorkers() {
//		return this.accountWorkers;
//	}
//
//	public void setAccountWorkers(Set accountWorkers) {
//		this.accountWorkers = accountWorkers;
//	}
//
//	public Set getAccountGroups() {
//		return this.accountGroups;
//	}
//
//	public void setAccountGroups(Set accountGroups) {
//		this.accountGroups = accountGroups;
//	}
//
//	public Set getAccountDoctors() {
//		return this.accountDoctors;
//	}
//
//	public void setAccountDoctors(Set accountDoctors) {
//		this.accountDoctors = accountDoctors;
//	}

}